// "breed": "Abyssinian",
// "country": "Ethiopia",
// "origin": "Natural/Standard",
// "coat": "Short",
// "pattern": "Ticked"

abstract class BreedEntity {
  final String breed;
  final String country;
  final String origin;
  final String coat;
  final String pattern;

  BreedEntity({
    required this.breed,
    required this.country,
    required this.origin,
    required this.coat,
    required this.pattern,
  });
}
