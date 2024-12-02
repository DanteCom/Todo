import 'package:gap/gap.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:todo/app/ui/theme/theme.dart';
import 'package:todo/app/ui/widgets/widgets.dart';
import 'package:todo/app/domain/states/states.dart';
import 'package:todo/app/domain/models/models.dart';

class FitnessGoalsCard extends StatelessWidget {
  const FitnessGoalsCard({super.key, required this.goal});

  final GoalModel goal;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<HealthState>();
    final fitness = goal.fitness!;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
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
                    SizedBox(
                      width: 40.w,
                      child: Text(
                        goal.name,
                        style: FontStyles.s16w500sf.copyWith(
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '10%complete',
                      style: FontStyles.s14w500sf.copyWith(
                        color: AppColors.grey40,
                      ),
                    ),
                    const Gap(8),
                    if (fitness.hours != null)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Flexible(
                            child: AppRichText(
                              title: fitness.hours!,
                              subtitle: 'Hours',
                            ),
                          ),
                          const Gap(8),
                          Flexible(
                            child: AppRichText(
                              title: fitness.mins,
                              subtitle: 'mins',
                            ),
                          ),
                        ],
                      ),
                    if (fitness.hours == null)
                      AppRichText(
                        title: fitness.mins,
                        subtitle: 'mins',
                      ),
                  ],
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
                      padding: const EdgeInsets.symmetric(vertical: 11),
                      decoration: BoxDecoration(
                        color: week.isActive ? AppColors.main : AppColors.grey8,
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
          const Gap(8),
          Text(
            '0 of 7 goals accomplished this week.',
            style: FontStyles.s14w500sf.copyWith(color: AppColors.grey40),
          ),
          const Gap(20),
          CupertinoButton(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(20),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isDismissible: false,
                isScrollControlled: true,
                builder: (context) => FitnessGoalBottomSheet(goal: goal),
              );
            },
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Center(
              child: Text(
                'Today\'s goal is accomplished',
                style: FontStyles.s16w500sf.copyWith(color: AppColors.grey40),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
