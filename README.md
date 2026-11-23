# Cat App

A Flutter project for discovering cat facts and browsing cat breeds.

## Features
- Fetch cat facts and refresh them with a pull gesture.
- Browse breeds and search by name, country, or coat.
- Switch between light and dark themes.
- Fall back to locally cached data when a remote request fails, if a cache exists.
- Show loading and error states.

## Implementation
- State management: Cubit with flutter_bloc.
- Networking: Dio through an API abstraction.
- Local cache: Hive CE.
- Dependency injection: get_it.
- Structure: data, domain, and presentation layers inside the home feature.
- Breed retrieval reads all API pages before returning the list.

## Run locally
1. Install Flutter with a bundled Dart SDK that satisfies pubspec.yaml (currently ^3.14.0).
2. Clone this repository and open its directory:

```sh
git clone https://github.com/AbdoTechno/cat_app.git
cd cat_app
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run
```

Configuration is defined by BASE_URL, FACT_ENDPOINT, and BREED_ENDPOINT in the current .env file. Keep private credentials out of tracked configuration.

## Tests
The repository includes tests for multi-page breed retrieval, invalid API responses, Cubit closure during loading, and theme toggling.

```sh
flutter test
flutter analyze
```

## Limitations
- A cache must have been populated before cached data can be used.
- Breed pages are fetched in sequence before the list is displayed.
- Runtime behavior and build compatibility still need verification on a device.
