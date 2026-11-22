import 'package:cat_app/core/enums/widget_state_enum.dart';
import 'package:cat_app/features/home/domain/entities/facts_entity.dart';
import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  final FactsEntity? factsEntity;
  final WidgetStateEnum widgetStateEnum;
  final String? message;

  const HomeState({
    this.factsEntity,
    this.widgetStateEnum = WidgetStateEnum.initial,
    this.message,
  });
  HomeState copyWith({
    FactsEntity? factsEntity,
    WidgetStateEnum? widgetStateEnum,
    String? message,
  }) {
    return HomeState(
      factsEntity: factsEntity ?? this.factsEntity,
      widgetStateEnum: widgetStateEnum ?? this.widgetStateEnum,
      message: message ?? this.message,
    );
  }

  bool get isLoading => widgetStateEnum.isLoading;
  bool get isFailure => widgetStateEnum.isFailure;

  @override
  List<Object?> get props => [factsEntity, widgetStateEnum, message];
}
