import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo/app/ui/theme/theme.dart';
import 'package:todo/resources/resources.dart';
import 'package:todo/app/ui/widgets/widgets.dart';
import 'package:todo/app/domain/models/models.dart';
import 'package:todo/app/domain/states/states.dart';

class CreateGoalDialog extends StatelessWidget {
  const CreateGoalDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CreateGoalState>();
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom / 1.2,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Create goal', style: FontStyles.s18w600sf),
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
                  Container(
                    padding: const EdgeInsets.all(2.5),
                    margin: const EdgeInsets.only(top: 24, bottom: 16),
                    decoration: BoxDecoration(
                      color: AppColors.grey8,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(
                        GoalModel.types.length,
                        (index) {
                          final goalType = GoalModel.types[index];
                          return Expanded(
                            child: CustomTextButton(
                              borderRadius: 18,
                              icon: goalType.icon,
                              text: state.capitalize(goalType.title),
                              isActive: state.categoryIndex == index,
                              onPressed: state.categoryIndex == index
                                  ? null
                                  : () {
                                      FocusScope.of(context).unfocus();
                                      state.changeCategoryIndex(index);
                                    },
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  AppTextFiled(
                    hintText: 'Name goal',
                    keyboardType: TextInputType.name,
                    onChanged: (_) => state.setState(),
                    controller: state.nameGoalController,
                  ),
                  if (state.categoryIndex == 0)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Gap(16),
                        const Text('Duration', style: FontStyles.s16w500sf),
                        const Gap(8),
                        Row(
                          children: [
                            Flexible(
                              child: AppTextFiled(
                                hintText: 'Hours',
                                onChanged: (_) => state.setState(),
                                controller: state.hoursControlller,
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            const Gap(8),
                            Flexible(
                              child: AppTextFiled(
                                hintText: 'Mins',
                                controller: state.minsController,
                                onChanged: (_) => state.setState(),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  if (state.categoryIndex == 1)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Gap(16),
                        const Text('Drink (ml)', style: FontStyles.s16w500sf),
                        const Gap(8),
                        AppTextFiled(
                          hintText: '0',
                          onChanged: (_) => state.setState(),
                          controller: state.weaterController,
                          keyboardType: TextInputType.number,
                        ),
                      ],
                    ),
                  if (state.categoryIndex == 2)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Gap(16),
                        const Text('Calories', style: FontStyles.s16w500sf),
                        const Gap(8),
                        AppTextFiled(
                          hintText: '0',
                          onChanged: (_) => state.setState(),
                          keyboardType: TextInputType.number,
                          controller: state.caloriesController,
                        ),
                      ],
                    ),
                  const Gap(24),
                  SizedBox(
                    width: double.infinity,
                    child: CupertinoButton(
                      color: AppColors.mainLight,
                      onPressed: () => state.onSave(context),
                      borderRadius: BorderRadius.circular(20),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        'Save',
                        style: FontStyles.s16w500sf.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
