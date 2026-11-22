import 'package:cat_app/app/cat_app.dart';
import 'package:cat_app/core/service locator/service_locator.dart';
import 'package:flutter/widgets.dart';
import 'package:material_ui/material_ui.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  runApp(const CatApp());
}
