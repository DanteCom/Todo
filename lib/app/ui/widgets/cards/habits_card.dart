import 'package:gap/gap.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:todo/app/ui/theme/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo/app/domain/models/models.dart';
import 'package:todo/app/domain/states/states.dart';
import 'package:todo/app/ui/widgets/bottom_sheets.dart/bottom_sheet.dart';

class HabitsCard extends StatelessWidget {
  const HabitsCard({super.key, required this.habit});

  final HabitModel habit;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<HabitsState>();
    return CupertinoButton(
      minSize: 0,
      padding: EdgeInsets.zero,
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isDismissible: false,
          isScrollControlled: true,
          builder: (context) => HabitBottomSheet(habit: habit),
        );
      },
      child: Container(
        width: 100.w / 2,
        height: 180,
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              habit.category.icon,
              // ignore: deprecated_member_use
              color: AppColors.purple,
            ),
            const Gap(5),
            Text(
              state.capitalize(habit.category.title),
              style: FontStyles.s14w500sf.copyWith(color: AppColors.grey40),
            ),
            const Gap(24),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(habit.name, style: FontStyles.s16w600sf),
                const Gap(5),
                Text(
                  state.capitalize(habit.type.name),
                  style: FontStyles.s14w500sf.copyWith(color: AppColors.grey40),
                )
              ],
            ),
            const Gap(12),
            Stack(
              children: [
                Container(
                  height: 4,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.grey8,
                  ),
                ),
                Container(
                  height: 4,
                  width: 20.w,
                  decoration: const BoxDecoration(
                    color: AppColors.purple,
                  ),
                ),
              ],
            ),
            const Gap(4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '5',
                  style: FontStyles.s14w500sf.copyWith(color: AppColors.grey40),
                ),
                Text(
                  '25',
                  style: FontStyles.s14w500sf.copyWith(color: AppColors.grey40),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
