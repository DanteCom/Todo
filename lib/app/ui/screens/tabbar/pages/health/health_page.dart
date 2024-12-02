import 'package:gap/gap.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:todo/app/ui/theme/theme.dart';
import 'package:todo/resources/resources.dart';
import 'package:todo/app/ui/widgets/widgets.dart';
import 'package:todo/app/domain/states/states.dart';

class HealthPage extends StatelessWidget {
  const HealthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<HealthState>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Health',
                style: FontStyles.s18w600sf.copyWith(color: AppColors.grey40),
              ),
              CupertinoButton(
                minSize: 0,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                borderRadius: BorderRadius.circular(32),
                color: AppColors.main,
                onPressed: () => state.onCreateGoal(context),
                child: Text(
                  'Create goal',
                  style: FontStyles.s16w500sf.copyWith(color: AppColors.white),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Center(
            child: Image.asset(
              Images.heart,
              height: 25.h,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Text(
          'Goals',
          style: FontStyles.s16w500sf.copyWith(color: AppColors.grey40),
        ),
        state.goalsList.isNotEmpty
            ? Column(
                children: List.generate(
                  state.goalsList.length,
                  (index) {
                    final goal = state.goalsList[index];
                    final water = state.goalsList[index].water;
                    final fitness = state.goalsList[index].fitness;
                    final nutrition = state.goalsList[index].nutrition;
                    return Column(
                      children: [
                        if (fitness != null) FitnessGoalsCard(goal: goal),
                        if (water != null) WaterGoalsCard(goal: goal),
                        if (nutrition != null) NutritionGoalsCard(goal: goal),
                      ],
                    );
                  },
                ),
              )
            : Column(
                children: [
                  const Gap(120),
                  EmptyWidget(
                    icon: Vectors.heart,
                    color: AppColors.grey8,
                    text:
                        'You do not have any health goals\nadded, to add a goal click on the\n“Create goal” button.',
                  ),
                ],
              ),
      ],
    );
  }
}
