import 'package:cat_app/core/service locator/service_locator.dart';
import 'package:cat_app/core/theme/app_sizes.dart';
import 'package:cat_app/core/theme/app_text_styles.dart';
import 'package:cat_app/core/theme/theme_toggle_button.dart';
import 'package:cat_app/features/home/presentation/controller/home_cubit.dart';
import 'package:cat_app/features/home/presentation/controller/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (_) {
        final cubit = getIt<HomeCubit>();
        cubit.getCatFacts();
        return cubit;
      },
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final facts = state.factsEntity;
          final colors = Theme.of(context).colorScheme;

          return Scaffold(
            appBar: AppBar(
              title: Text(
                'حقائق القطط',
                style: AppTextStyles.titleLarge.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              centerTitle: true,
              actions: const [ThemeToggleButton()],
            ),
            body: SafeArea(
              child: RefreshIndicator(
                color: colors.primary,
                displacement: 48,
                edgeOffset: 8,
                triggerMode: RefreshIndicatorTriggerMode.onEdge,
                onRefresh: context.read<HomeCubit>().getCatFacts,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: constraints.maxHeight - 48,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 112,
                              height: 112,
                              decoration: BoxDecoration(
                                color: colors.primaryContainer,
                                borderRadius: BorderRadius.circular(
                                  AppSizes.r32,
                                ),
                              ),
                              child: Icon(
                                Icons.pets_rounded,
                                size: 62,
                                color: colors.primary,
                              ),
                            ),
                            SizedBox(height: AppSizes.p24),
                            Text(
                              'هل تعلم؟',
                              style: AppTextStyles.displaySmall.copyWith(
                                color: colors.onSurface,
                              ),
                            ),
                            SizedBox(height: AppSizes.p8),
                            Text(
                              'اكتشف معلومة جديدة عن أصدقائنا ذوي الفراء',
                              textAlign: TextAlign.center,
                              style: AppTextStyles.bodyMedium.copyWith(
                                color: colors.secondary,
                              ),
                            ),
                            SizedBox(height: AppSizes.p24),
                            _FactCard(state: state, fact: facts?.fact),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _FactCard extends StatelessWidget {
  const _FactCard({required this.state, required this.fact});

  final HomeState state;
  final String? fact;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    Widget content;

    if (state.isLoading) {
      content = Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(color: colors.primary),
          SizedBox(height: AppSizes.p16),
          Text(
            'جاري تحميل حقيقة جديدة...',
            style: AppTextStyles.bodyMedium.copyWith(
              color: colors.secondary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      );
    } else if (state.isFailure) {
      content = Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.cloud_off_rounded, size: 42, color: colors.error),
          SizedBox(height: AppSizes.p12),
          Text(
            state.message ?? 'تعذر تحميل الحقيقة',
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyMedium.copyWith(
              color: colors.error,
              height: 1.5,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      );
    } else {
      content = Text(
        fact?.trim().isNotEmpty == true ? fact! : 'استعد لاكتشاف عالم القطط',
        textAlign: TextAlign.center,
        style: AppTextStyles.bodyLarge.copyWith(
          height: 1.6,
          color: colors.onSurface,
          fontWeight: FontWeight.w600,
        ),
      );
    }

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 560),
      child: Card(
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.r24),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.p24,
            vertical: AppSizes.p24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: colors.primaryContainer,
                      borderRadius: BorderRadius.circular(AppSizes.r12),
                    ),
                    child: Icon(
                      Icons.menu_book_rounded,
                      size: AppSizes.iconSmall,
                      color: colors.primary,
                    ),
                  ),
                  SizedBox(width: AppSizes.p8),
                  Text(
                    'معلومة اليوم',
                    style: AppTextStyles.labelLarge.copyWith(
                      color: colors.primary,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.pets_rounded,
                    size: AppSizes.iconSmall,
                    color: colors.secondary,
                  ),
                ],
              ),
              SizedBox(height: AppSizes.p24),
              SizedBox(width: double.infinity, child: content),
            ],
          ),
        ),
      ),
    );
  }
}
