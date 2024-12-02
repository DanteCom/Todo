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

class HabitBottomSheet extends StatelessWidget {
  const HabitBottomSheet({super.key, required this.habit});

  final HabitModel habit;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<HabitsState>();
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Feedback', style: FontStyles.s18w600sf),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () => context.pop(),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.grey8,
                      ),
                      child: SvgPicture.asset(
                        Vectors.close,
                      ),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              Vectors.run,
                              // ignore: deprecated_member_use
                              color: AppColors.purple,
                            ),
                            const Gap(4),
                            Text(
                              'Sport',
                              style: FontStyles.s14w500sf.copyWith(
                                color: AppColors.grey40,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text(
                              'Morning stretches',
                              style: FontStyles.s16w500sf,
                            ),
                            Text(
                              'Weekly',
                              style: FontStyles.s14w500sf.copyWith(
                                color: AppColors.grey40,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    const Gap(24),
                    Stack(
                      children: [
                        Container(
                          height: 4,
                          width: double.infinity,
                          decoration: BoxDecoration(color: AppColors.grey8),
                        ),
                        Container(
                          height: 4,
                          width: 25.w,
                          decoration:
                              const BoxDecoration(color: AppColors.purple),
                        ),
                      ],
                    ),
                    const Gap(4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '5',
                          style: FontStyles.s14w500sf.copyWith(
                            color: AppColors.grey40,
                          ),
                        ),
                        Text(
                          '25',
                          style: FontStyles.s14w500sf.copyWith(
                            color: AppColors.grey40,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Gap(20),
              Text(
                'Statistics',
                style: FontStyles.s16w500sf.copyWith(color: AppColors.grey40),
              ),
              const Gap(8),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: StaticsCard(
                          title: '5',
                          subtitle: 'days',
                          name: 'Current streak',
                        ),
                      ),
                      Gap(8),
                      Expanded(
                        child: StaticsCard(
                          title: '5',
                          subtitle: 'days',
                          name: 'Best streak day',
                        ),
                      ),
                    ],
                  ),
                  Gap(8),
                  Row(
                    children: [
                      Expanded(
                        child: StaticsCard(
                          title: '5',
                          subtitle: '/25',
                          name: 'Completed habits',
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ],
              ),
              const Gap(20),
              Row(
                children: [
                  Expanded(
                    child: CupertinoButton(
                      onPressed: () {},
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
                      onPressed: () => state.delete(context, habit),
                      color: AppColors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      borderRadius: BorderRadius.circular(20),
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
