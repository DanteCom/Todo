import 'package:gap/gap.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/app/ui/theme/theme.dart';
import 'package:todo/resources/resources.dart';
import 'package:todo/app/ui/widgets/widgets.dart';
import 'package:todo/app/domain/models/models.dart';
import 'package:todo/app/domain/states/states.dart';

class FitnessGoalBottomSheet extends StatelessWidget {
  const FitnessGoalBottomSheet({super.key, required this.goal});

  final GoalModel goal;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<HealthState>();
    final fitness = goal.fitness!;
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Gap(8),
              Container(
                width: 40,
                height: 8,
                decoration: BoxDecoration(
                  color: AppColors.grey8,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () => context.pop(),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.grey8,
                      ),
                      child: SvgPicture.asset(Vectors.close),
                    ),
                  ),
                ],
              ),
              const Gap(20),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 20,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          fitness.category.icon,
                          // ignore: deprecated_member_use
                          color: AppColors.main,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Text(
                            state.capitalize(fitness.category.title),
                            style: FontStyles.s14w500sf.copyWith(
                              color: AppColors.grey40,
                            ),
                          ),
                        ),
                        Text(
                          goal.name,
                          style: FontStyles.s16w500sf.copyWith(
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const Gap(20),
                    Row(
                      children: [
                        Wrap(
                          spacing: 2,
                          children: List.generate(
                            fitness.weeks.length,
                            (index) {
                              final week = fitness.weeks[index];
                              return Container(
                                width: 100.w / 7 - 12,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                  color: week.isActive
                                      ? AppColors.main
                                      : AppColors.grey8,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  week.text[0],
                                  style: FontStyles.s14w500sf.copyWith(
                                    color: week.isActive
                                        ? AppColors.white
                                        : AppColors.grey40,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 16,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Goal',
                        style: FontStyles.s14w500sf
                            .copyWith(color: AppColors.grey40),
                      ),
                      const Gap(8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (fitness.hours != null)
                            AppRichText(
                              subtitle: 'Hours',
                              title: fitness.hours!,
                            ),
                          if (fitness.hours != null) const Gap(10),
                          AppRichText(
                            title: fitness.mins,
                            subtitle: 'mins',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                'Statistics',
                style: FontStyles.s16w500sf.copyWith(color: AppColors.grey40),
              ),
              const Gap(8),
              const Row(
                children: [
                  Expanded(
                    child: StaticsCard(
                      title: '10',
                      subtitle: '%',
                      name: 'Complete',
                    ),
                  ),
                  Gap(8),
                  Expanded(
                    child: StaticsCard(
                      title: '1',
                      subtitle: 'of 7',
                      name: 'Completed this week',
                    ),
                  )
                ],
              ),
              const Gap(20),
              Row(
                children: [
                  Expanded(
                    child: CupertinoButton(
                      onPressed: () => state.editGoal(),
                      color: AppColors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      borderRadius: BorderRadius.circular(20),
                      child:
                          const Text('Edit goal', style: FontStyles.s16w600sf),
                    ),
                  ),
                  const Gap(8),
                  Expanded(
                    child: CupertinoButton(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(20),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      onPressed: () {
                        context.pop();
                        GoalModel.delete(goal, GoalCategory.fitness);
                      },
                      child: Text(
                        'Delete goal',
                        style: FontStyles.s16w600sf.copyWith(
                          color: AppColors.main,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Gap(40),
            ],
          ),
        ),
      ),
    );
  }
}
