import 'package:cat_app/features/home/presentation/controller/breeds_state.dart';
import 'package:cat_app/features/home/presentation/widgets/breed_card.dart';
import 'package:cat_app/core/theme/app_sizes.dart';
import 'package:cat_app/core/theme/app_text_styles.dart';
import 'package:material_ui/material_ui.dart';

class BreedsList extends StatelessWidget {
  const BreedsList({super.key, required this.state});

  final BreedsState state;

  @override
  Widget build(BuildContext context) {
    if (state.breeds.isEmpty && state.isFailure) {
      return _stateMessage(
        context,
        icon: Icons.cloud_off_rounded,
        title: state.message ?? 'تعذر تحميل السلالات',
        subtitle: 'اسحب لأسفل للمحاولة مرة أخرى',
        color: Theme.of(context).colorScheme.error,
      );
    }

    if (state.breeds.isEmpty && state.isLoading) {
      return _stateMessage(
        context,
        icon: Icons.pets_rounded,
        title: 'جاري تحميل السلالات...',
        isLoading: true,
        color: Theme.of(context).colorScheme.primary,
      );
    }

    final breeds = state.filteredBreeds;
    if (breeds.isEmpty) {
      final hasQuery = state.searchQuery.trim().isNotEmpty;
      return _stateMessage(
        context,
        icon: hasQuery ? Icons.search_off_rounded : Icons.pets_rounded,
        title: hasQuery ? 'لا توجد نتائج مطابقة' : 'لا توجد سلالات متاحة',
        subtitle: hasQuery
            ? 'جرّب البحث باسم أو دولة مختلفة'
            : 'اسحب لأسفل لتحديث القائمة',
        color: Theme.of(context).colorScheme.primary,
      );
    }

    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: EdgeInsets.fromLTRB(AppSizes.p20, 0, AppSizes.p20, AppSizes.p24),
      itemCount: breeds.length,
      itemBuilder: (context, index) => BreedCard(breed: breeds[index]),
    );
  }

  Widget _stateMessage(
    BuildContext context, {
    required IconData icon,
    required String title,
    required Color color,
    String? subtitle,
    bool isLoading = false,
  }) {
    final colors = Theme.of(context).colorScheme;
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      children: [
        SizedBox(
          height: 320,
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(AppSizes.p24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(
                      color: colors.primaryContainer,
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: isLoading
                        ? SizedBox(
                            width: AppSizes.iconMedium,
                            height: AppSizes.iconMedium,
                            child: CircularProgressIndicator(
                              strokeWidth: 2.5,
                              color: color,
                            ),
                          )
                        : Icon(icon, size: 32, color: color),
                  ),
                  SizedBox(height: AppSizes.p16),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.titleMedium.copyWith(
                      color: colors.onSurface,
                    ),
                  ),
                  if (subtitle != null) ...[
                    SizedBox(height: AppSizes.p8),
                    Text(
                      subtitle,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.bodySmall.copyWith(
                        color: colors.onSurfaceVariant,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
