import 'package:cat_app/core/service locator/service_locator.dart';
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

          return Scaffold(
            backgroundColor: const Color(0xFFF6F8FC),
            appBar: AppBar(
              title: const Text(
                'حقائق القطط',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              centerTitle: true,
              elevation: 0,
              backgroundColor: const Color(0xFFF6F8FC),
              foregroundColor: const Color(0xFF263238),
            ),
            body: SafeArea(
              child: RefreshIndicator(
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
                                color: const Color(0xFFE8EAF6),
                                borderRadius: BorderRadius.circular(32),
                              ),
                              child: const Icon(
                                Icons.pets_rounded,
                                size: 62,
                                color: Color(0xFF5C6BC0),
                              ),
                            ),
                            const SizedBox(height: 24),
                            const Text(
                              'هل تعلم؟',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w800,
                                color: Color(0xFF263238),
                              ),
                            ),
                            const SizedBox(height: 16),
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
    Widget content;

    if (state.isLoading) {
      content = const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 16),
          Text(
            'جاري تحميل حقيقة جديدة...',
            style: TextStyle(
              color: Color(0xFF78909C),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      );
    } else if (state.isFailure) {
      content = Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.cloud_off_rounded,
            size: 42,
            color: Color(0xFFE57373),
          ),
          const SizedBox(height: 12),
          Text(
            state.message ?? 'تعذر تحميل الحقيقة',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFFC62828),
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
        style: const TextStyle(
          fontSize: 18,
          height: 1.6,
          color: Color(0xFF37474F),
          fontWeight: FontWeight.w600,
        ),
      );
    }

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 520),
      child: Card(
        elevation: 3,
        shadowColor: const Color(0x1A263238),
        margin: EdgeInsets.zero,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
          child: SizedBox(width: double.infinity, child: content),
        ),
      ),
    );
  }
}
