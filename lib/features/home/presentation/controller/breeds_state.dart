import 'package:cat_app/core/enums/widget_state_enum.dart';
import 'package:cat_app/features/home/domain/entities/breed_entity.dart';
import 'package:equatable/equatable.dart';

class BreedsState extends Equatable {
  final List<BreedEntity> breeds;
  final WidgetStateEnum widgetStateEnum;
  final String? message;
  final String searchQuery;

  const BreedsState({
    this.breeds = const [],
    this.widgetStateEnum = WidgetStateEnum.initial,
    this.message,
    this.searchQuery = '',
  });

  List<BreedEntity> get filteredBreeds {
    final query = searchQuery.trim().toLowerCase();
    if (query.isEmpty) {
      return breeds;
    }

    return breeds.where((breed) {
      return breed.breed.toLowerCase().contains(query) ||
          breed.country.toLowerCase().contains(query) ||
          breed.origin.toLowerCase().contains(query) ||
          breed.coat.toLowerCase().contains(query) ||
          breed.pattern.toLowerCase().contains(query);
    }).toList();
  }

  BreedsState copyWith({
    List<BreedEntity>? breeds,
    WidgetStateEnum? widgetStateEnum,
    String? message,
    String? searchQuery,
  }) {
    return BreedsState(
      breeds: breeds ?? this.breeds,
      widgetStateEnum: widgetStateEnum ?? this.widgetStateEnum,
      message: message ?? this.message,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }

  bool get isLoading => widgetStateEnum.isLoading;
  bool get isFailure => widgetStateEnum.isFailure;
  bool get isSuccess => widgetStateEnum.isSuccess;

  @override
  List<Object?> get props => [breeds, widgetStateEnum, message, searchQuery];
}
