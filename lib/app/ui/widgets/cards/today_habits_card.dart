import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo/app/ui/theme/theme.dart';
import 'package:todo/resources/resources.dart';
import 'package:todo/app/domain/models/models.dart';
import 'package:todo/app/domain/states/states.dart';

class TodayHabitsCard extends StatelessWidget {
  const TodayHabitsCard({super.key, required this.habit});

  final HabitModel habit;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<HabitsState>();
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            habit.category.icon,
            // ignore: deprecated_member_use
            color: AppColors.purple,
            width: 32,
            height: 32,
          ),
          const Gap(8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(habit.name, style: FontStyles.s16w500sf),
                const Gap(5),
                Text(
                  state.capitalize(habit.type.name),
                  style: FontStyles.s14w500sf.copyWith(color: AppColors.grey40),
                ),
              ],
            ),
          ),
          Container(
            width: 40,
            height: 40,
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: AppColors.purple,
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(Vectors.check),
          ),
        ],
      ),
    );
  }
}
