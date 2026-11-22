import 'package:cat_app/features/home/domain/entities/breed_entity.dart';
import 'package:material_ui/material_ui.dart';

class BreedCard extends StatelessWidget {
  const BreedCard({super.key, required this.breed});

  final BreedEntity breed;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              breed.breed,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: Color(0xFF263238),
              ),
            ),
            const SizedBox(height: 12),
            _BreedDetail(label: 'الدولة', value: breed.country),
            _BreedDetail(label: 'الأصل', value: breed.origin),
            _BreedDetail(label: 'نوع الفراء', value: breed.coat),
            _BreedDetail(label: 'النقشة', value: breed.pattern),
          ],
        ),
      ),
    );
  }
}

class _BreedDetail extends StatelessWidget {
  const _BreedDetail({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 92,
            child: Text(
              '$label:',
              style: const TextStyle(
                color: Color(0xFF78909C),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(color: Color(0xFF37474F)),
            ),
          ),
        ],
      ),
    );
  }
}
