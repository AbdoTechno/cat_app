import 'package:cat_app/core/service locator/service_locator.dart';
import 'package:cat_app/core/theme/app_sizes.dart';
import 'package:cat_app/core/theme/app_text_styles.dart';
import 'package:cat_app/core/theme/theme_toggle_button.dart';
import 'package:cat_app/features/home/presentation/controller/breeds_cubit.dart';
import 'package:cat_app/features/home/presentation/controller/breeds_state.dart';
import 'package:cat_app/features/home/presentation/widgets/breeds_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BreedsCubit>(
      create: (_) => getIt<BreedsCubit>()..getBreeds(),
      child: const _BreedsView(),
    );
  }
}

class _BreedsView extends StatelessWidget {
  const _BreedsView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BreedsCubit, BreedsState>(
      builder: (context, state) {
        final colors = Theme.of(context).colorScheme;
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'سلالات القطط',
              style: AppTextStyles.titleLarge.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            centerTitle: true,
            actions: const [ThemeToggleButton()],
          ),
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    AppSizes.p20,
                    AppSizes.p8,
                    AppSizes.p20,
                    AppSizes.p16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'اكتشف سلالتك المفضلة',
                        style: AppTextStyles.headlineMedium.copyWith(
                          color: colors.onSurface,
                        ),
                      ),
                      SizedBox(height: AppSizes.p4),
                      Text(
                        'تعرّف على أصل كل سلالة وصفاتها.',
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: colors.secondary,
                        ),
                      ),
                      SizedBox(height: AppSizes.p16),
                      TextField(
                        onChanged: context.read<BreedsCubit>().searchBreeds,
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: colors.onSurface,
                        ),
                        decoration: InputDecoration(
                          hintText: 'ابحث بالاسم أو الدولة أو نوع الفراء',
                          prefixIcon: Icon(
                            Icons.search_rounded,
                            color: colors.primary,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(AppSizes.r16),
                          ),
                        ),
                      ),
                      if (state.breeds.isNotEmpty) ...[
                        SizedBox(height: AppSizes.p12),
                        Text(
                          '${state.filteredBreeds.length} سلالة',
                          style: AppTextStyles.labelMedium.copyWith(
                            color: colors.secondary,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                Expanded(
                  child: RefreshIndicator(
                    color: colors.primary,
                    onRefresh: context.read<BreedsCubit>().getBreeds,
                    child: BreedsList(state: state),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
