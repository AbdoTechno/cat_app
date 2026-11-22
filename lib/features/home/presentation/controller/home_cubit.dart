import 'package:cat_app/core/enums/widget_state_enum.dart';
import 'package:cat_app/features/home/domain/usecases/get_cat_facts_use_case.dart';
import 'package:cat_app/features/home/presentation/controller/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.getFactsUseCase}) : super(const HomeState());

  final GetCatFactsUseCase getFactsUseCase;

  void _onChangeScreenState(WidgetStateEnum screenStateEnum) {
    if (!isClosed) {
      emit(state.copyWith(widgetStateEnum: screenStateEnum));
    }
  }

  Future<void> getCatFacts() async {
    _onChangeScreenState(WidgetStateEnum.loading);
    final result = await getFactsUseCase();
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
      (factsEntity) {
        _onChangeScreenState(WidgetStateEnum.success);
        emit(state.copyWith(factsEntity: factsEntity));
      },
    );
  }
}
