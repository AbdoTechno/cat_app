import 'package:cat_app/core/service locator/service_locator.dart';
import 'package:cat_app/features/home/presentation/controller/breeds_cubit.dart';
import 'package:cat_app/features/home/presentation/controller/breeds_state.dart';
import 'package:cat_app/features/home/presentation/widgets/breeds_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BreedsCubit>(
      create: (_) => getIt<BreedsCubit>()..getBreeds(),
      child: const _BreedsView(),
    );
  }
}

class _BreedsView extends StatelessWidget {
  const _BreedsView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BreedsCubit, BreedsState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color(0xFFF6F8FC),
          appBar: AppBar(
            title: const Text(
              'سلالات القطط',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            centerTitle: true,
            elevation: 0,
            backgroundColor: const Color(0xFFF6F8FC),
            foregroundColor: const Color(0xFF263238),
          ),
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
                  child: TextField(
                    onChanged: context.read<BreedsCubit>().searchBreeds,
                    decoration: InputDecoration(
                      hintText: 'ابحث عن سلالة أو دولة أو نوع الفراء',
                      prefixIcon: const Icon(Icons.search_rounded),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: context.read<BreedsCubit>().getBreeds,
                    child: BreedsList(state: state),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
