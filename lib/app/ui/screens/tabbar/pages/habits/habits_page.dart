import 'package:sizer/sizer.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:todo/app/ui/theme/theme.dart';
import 'package:todo/resources/resources.dart';
import 'package:todo/app/ui/widgets/widgets.dart';
import 'package:todo/app/domain/states/habits_state.dart';

class HabitsPage extends StatelessWidget {
  const HabitsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<HabitsState>();
    final todayHabits = state.todayHabits;
    final habits = state.habitsList;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Habits',
                style: FontStyles.s18w600sf.copyWith(color: AppColors.grey40),
              ),
              CupertinoButton(
                minSize: 0,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                borderRadius: BorderRadius.circular(32),
                color: AppColors.purple,
                onPressed: () => state.onCreateHabit(context),
                child: Text(
                  'Add habit',
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
              Images.habit,
              height: 25.h,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Habits',
              style: FontStyles.s16w500sf.copyWith(color: AppColors.grey40),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 16),
              child: SizedBox(
                width: 100.w,
                height: 190,
                child: habits.isNotEmpty
                    ? ListView(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.horizontal,
                        children: List.generate(
                          habits.length,
                          (index) => HabitsCard(habit: habits[index]),
                        ),
                      )
                    : EmptyWidget(
                        icon: Vectors.run,
                        color: AppColors.grey8,
                        text:
                            'You don\'t have any habits added, to add a\nhabit, click on the “Add habbit” button',
                      ),
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Today habits',
              style: FontStyles.s16w500sf.copyWith(color: AppColors.grey40),
            ),
            if (todayHabits.isNotEmpty)
              ...List.generate(
                todayHabits.length,
                (index) => TodayHabitsCard(habit: todayHabits[index]),
              ),
            if (todayHabits.isEmpty)
              const Padding(
                padding: EdgeInsets.only(top: 40),
                child: EmptyWidget(
                  icon: Vectors.checkCircular,
                  text: 'Oops, looks like you didn\'t\nadd the habit',
                ),
              ),
          ],
        ),
      ],
    );
  }
}
