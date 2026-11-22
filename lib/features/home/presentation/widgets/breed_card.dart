import 'package:cat_app/features/home/domain/entities/breed_entity.dart';
import 'package:cat_app/core/theme/app_sizes.dart';
import 'package:cat_app/core/theme/app_text_styles.dart';
import 'package:material_ui/material_ui.dart';

class BreedCard extends StatelessWidget {
  const BreedCard({super.key, required this.breed});

  final BreedEntity breed;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Card(
      margin: EdgeInsets.only(bottom: AppSizes.p12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.r24),
      ),
      child: Padding(
        padding: EdgeInsets.all(AppSizes.p16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: colors.primaryContainer,
                    borderRadius: BorderRadius.circular(AppSizes.r16),
                  ),
                  child: Icon(
                    Icons.pets_rounded,
                    color: colors.primary,
                    size: AppSizes.iconMedium,
                  ),
                ),
                SizedBox(width: AppSizes.p12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        breed.breed,
                        style: AppTextStyles.titleLarge.copyWith(
                          color: colors.onSurface,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: AppSizes.p4),
                      Row(
                        children: [
                          Icon(
                            Icons.public_rounded,
                            size: AppSizes.iconSmall,
                            color: colors.secondary,
                          ),
                          SizedBox(width: AppSizes.p4),
                          Expanded(
                            child: Text(
                              breed.country,
                              style: AppTextStyles.bodySmall.copyWith(
                                color: colors.secondary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: AppSizes.p12),
              child: Divider(color: colors.outlineVariant),
            ),
            Text(
              'المنشأ: ${breed.origin}',
              style: AppTextStyles.bodyMedium.copyWith(
                color: colors.onSurfaceVariant,
              ),
            ),
            SizedBox(height: AppSizes.p12),
            Wrap(
              spacing: AppSizes.p8,
              runSpacing: AppSizes.p8,
              children: [
                _BreedTag(
                  icon: Icons.content_cut_rounded,
                  label: 'الفراء: ${breed.coat}',
                ),
                _BreedTag(
                  icon: Icons.pattern_rounded,
                  label: 'النقشة: ${breed.pattern}',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _BreedTag extends StatelessWidget {
  const _BreedTag({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.p12,
        vertical: AppSizes.p8,
      ),
      decoration: BoxDecoration(
        color: colors.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(AppSizes.r12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: AppSizes.iconSmall, color: colors.primary),
          SizedBox(width: AppSizes.p8),
          Flexible(
            child: Text(
              label,
              style: AppTextStyles.labelSmall.copyWith(
                color: colors.onSurfaceVariant,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
