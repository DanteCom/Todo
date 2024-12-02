import 'package:gap/gap.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:todo/app/ui/theme/theme.dart';
import 'package:todo/resources/resources.dart';
import 'package:todo/app/ui/widgets/widgets.dart';
import 'package:todo/app/domain/states/states.dart';
import 'package:todo/app/domain/models/models.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<HomeState>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            'Main',
            style: FontStyles.s18w600sf.copyWith(color: AppColors.grey40),
          ),
        ),
        const Gap(7),
        Center(
          child: Image.asset(
            Images.home,
            height: 25.h,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 16),
          child: Row(
            children: List.generate(
              TaskCategory.values.length,
              (index) => Row(
                children: [
                  CustomTextButton(
                    color: AppColors.white,
                    disabledColor: AppColors.blue,
                    isActive: state.categoryIndex == index,
                    onPressed: state.categoryIndex == index
                        ? null
                        : () => state.changeCategoryIndex(index),
                    text: state.capitalize(TaskCategory.values[index].name),
                  ),
                  const Gap(8),
                ],
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                style: FontStyles.s16w500sf,
                state.capitalize(TaskCategory.values[state.categoryIndex].name),
              ),
              const Gap(8),
              Stack(
                children: [
                  Container(
                    height: 8,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.grey8,
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  AnimatedContainer(
                    height: 8,
                    width: state.lineStatus(85.w),
                    duration: kThemeAnimationDuration,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: AppColors.blue,
                    ),
                  ),
                ],
              ),
              const Gap(4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Complete ${PeriodicityType.values[state.periodicityIndex].name} tasks',
                    style:
                        FontStyles.s14w500sf.copyWith(color: AppColors.grey40),
                  ),
                  Text(
                    '${state.lineStatus(100).toInt()}%',
                    style:
                        FontStyles.s14w500sf.copyWith(color: AppColors.grey40),
                  ),
                ],
              ),
            ],
          ),
        ),
        const Gap(20),
        Text(
          'Tasks',
          style: FontStyles.s16w500sf.copyWith(color: AppColors.grey40),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: List.generate(
              PeriodicityType.values.length,
              (index) => Padding(
                padding: const EdgeInsets.only(right: 8),
                child: CustomTextButton(
                  color: AppColors.white,
                  isActive: state.periodicityIndex == index,
                  disabledColor: AppColors.blue,
                  onPressed: state.periodicityIndex == index
                      ? null
                      : () => state.changePeriodicityIndex(index),
                  text: state.capitalize(PeriodicityType.values[index].name),
                ),
              ),
            ),
          ),
        ),
        if (state.tasksList.isEmpty)
          EmptyWidget(
            icon: Vectors.home,
            color: AppColors.grey8,
            text:
                'You don\'t have any tasks added,\nadd a task and it will appear here.',
          ),
        if (state.tasksList.isNotEmpty)
          ...List.generate(
            state.tasksList.length,
            (index) {
              final task = state.tasksList[index];
              return CheckTextWidget(
                text: task.name,
                isActive: task.isActive,
                onPressed: () => task.delete(),
                onChanged: (newValue) => state.onCheckBox(index, newValue),
              );
            },
          ),
        const Gap(16),
        CupertinoButton(
          minSize: 5,
          padding: EdgeInsets.zero,
          onPressed: () => state.showCreateTeskDialog(context),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.add,
                color: AppColors.blue,
              ),
              const Gap(4),
              Text(
                'Add task',
                style: FontStyles.s16w500sf.copyWith(color: AppColors.blue),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
