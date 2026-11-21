import 'package:cat_app/core/databases/api/dio_service.dart';
import 'package:cat_app/features/home/data/datasources/cat_local_data_source.dart';
import 'package:cat_app/features/home/data/datasources/cat_remote_data_source.dart';
import 'package:cat_app/features/home/data/repositories/cat_repository_impl.dart';
import 'package:cat_app/features/home/domain/usecases/get_cat_facts_use_case.dart';
import 'package:dio/dio.dart';
import 'package:material_ui/material_ui.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cat Facts')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to the Cat Facts App!',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16),
            Text(
              'Get ready to learn some interesting facts about cats.',
              style: TextStyle(fontSize: 16),
            ),
            ElevatedButton(
              child: Text('Get Cat Facts'),
              onPressed: () async {
                GetCatFactsUseCase getCatFactsUseCase = GetCatFactsUseCase(
                  catRepository: CatRepositoryImpl(
                    remoteDataSource: CatRemoteDataSourceImpl(
                      dioService: DioService(Dio()),
                    ),
                    localDataSource: CatLocalDataSourceImpl(),
                  ),
                );
                final result = await getCatFactsUseCase();
                result.fold(
                  (failure) {
                    // Handle failure case
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Error: ${failure.errMessage}')),
                    );
                  },
                  (factsEntity) {
                    // Handle success case
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Fetched ${factsEntity.length} cat facts!',
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
