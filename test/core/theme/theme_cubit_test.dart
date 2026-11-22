import 'package:cat_app/core/theme/theme_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

void main() {
  late ThemeCubit cubit;

  setUp(() {
    cubit = ThemeCubit();
  });

  tearDown(() async {
    await cubit.close();
  });

  test('toggles between dark and light themes', () {
    expect(cubit.state, ThemeMode.dark);

    cubit.toggleTheme();
    expect(cubit.state, ThemeMode.light);

    cubit.toggleTheme();
    expect(cubit.state, ThemeMode.dark);
  });
}
