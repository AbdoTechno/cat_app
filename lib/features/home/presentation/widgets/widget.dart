import 'package:material_ui/material_ui.dart';

class TemplateWidget extends StatelessWidget {
  const TemplateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: const Text('Template Widget'),
    );
  }
}