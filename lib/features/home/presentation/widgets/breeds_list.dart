import 'package:cat_app/features/home/presentation/controller/breeds_state.dart';
import 'package:cat_app/features/home/presentation/widgets/breed_card.dart';
import 'package:material_ui/material_ui.dart';

class BreedsList extends StatelessWidget {
  const BreedsList({super.key, required this.state});

  final BreedsState state;

  @override
  Widget build(BuildContext context) {
    if (state.breeds.isEmpty && state.isLoading) {
      return ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: const [
          SizedBox(
            height: 320,
            child: Center(child: CircularProgressIndicator()),
          ),
        ],
      );
    }

    if (state.breeds.isEmpty && state.isFailure) {
      return ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          SizedBox(
            height: 320,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  state.message ?? 'تعذر تحميل السلالات',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFFC62828),
                    height: 1.5,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    }

    final breeds = state.filteredBreeds;
    if (breeds.isEmpty) {
      return ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          SizedBox(
            height: 260,
            child: Center(
              child: Text(
                state.searchQuery.trim().isEmpty
                    ? 'لا توجد سلالات متاحة'
                    : 'لا توجد نتائج مطابقة',
                style: const TextStyle(
                  color: Color(0xFF78909C),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      );
    }

    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
      itemCount: breeds.length,
      itemBuilder: (context, index) => BreedCard(breed: breeds[index]),
    );
  }
}
