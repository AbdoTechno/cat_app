import 'package:cat_app/core/enums/widget_state_enum.dart';
import 'package:cat_app/features/home/domain/usecases/get_breeds_use_case.dart';
import 'package:cat_app/features/home/presentation/controller/breeds_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BreedsCubit extends Cubit<BreedsState> {
  BreedsCubit({required this.getBreedsUseCase}) : super(const BreedsState());

  final GetBreedsUseCase getBreedsUseCase;

  Future<void> getBreeds() async {
    emit(
      BreedsState(
        breeds: state.breeds,
        widgetStateEnum: WidgetStateEnum.loading,
        searchQuery: state.searchQuery,
      ),
    );

    final result = await getBreedsUseCase();
    if (isClosed) {
      return;
    }

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            widgetStateEnum: WidgetStateEnum.failure,
            message: failure.errMessage,
          ),
        );
      },
      (breeds) {
        emit(
          BreedsState(
            breeds: breeds,
            widgetStateEnum: WidgetStateEnum.success,
            searchQuery: state.searchQuery,
          ),
        );
      },
    );
  }

  void searchBreeds(String query) {
    emit(state.copyWith(searchQuery: query));
  }
}
