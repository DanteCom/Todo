import 'package:gap/gap.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/app/ui/theme/theme.dart';
import 'package:todo/resources/resources.dart';
import 'package:todo/app/ui/widgets/widgets.dart';
import 'package:todo/app/domain/models/models.dart';
import 'package:todo/app/domain/states/create_habit_state.dart';

class CreateHabitDialog extends StatelessWidget {
  const CreateHabitDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CreateHabitState>();
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom / 1.5,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Add habit', style: FontStyles.s18w600sf),
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
                  const Gap(24),
                  AppTextFiled(
                    hintText: 'Name habit',
                    controller: state.nameController,
                    keyboardType: TextInputType.name,
                    onChanged: (_) => state.setState(),
                  ),
                  Container(
                    padding: const EdgeInsets.all(2.5),
                    margin: const EdgeInsets.only(top: 24, bottom: 16),
                    decoration: BoxDecoration(
                      color: AppColors.grey8,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: List.generate(
                        PeriodicityType.values.length,
                        (index) {
                          final type = PeriodicityType.values[index];
                          return Expanded(
                            child: CustomTextButton(
                              text: state.capitalize(type.name),
                              borderRadius: 18,
                              isActive: state.periodicityIndex == index,
                              onPressed: state.periodicityIndex == index
                                  ? null
                                  : () {
                                      FocusScope.of(context).unfocus();
                                      state.changePeriodicityIndex(index);
                                    },
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Number of repetitions to perform',
                        style: FontStyles.s16w500sf,
                      ),
                      const Gap(8),
                      AppTextFiled(
                        hintText: '0',
                        onChanged: (_) => state.setState(),
                        keyboardType: TextInputType.number,
                        controller: state.repetitionsController,
                      ),
                    ],
                  ),
                  const Gap(16),
                  const Text('Category', style: FontStyles.s16w500sf),
                  const Gap(8),
                  SizedBox(
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      direction: Axis.horizontal,
                      children: List.generate(
                        HabitModel.categories.length,
                        (index) {
                          final categorys = HabitModel.categories[index];
                          return CustomTextButton(
                            icon: categorys.icon,
                            text: state.capitalize(categorys.title),
                            color: state.currentCategoryIndex == index
                                ? AppColors.mainLight
                                : AppColors.white,
                            isActive: state.currentCategoryIndex == index,
                            onPressed: () {
                              state.changeCategoryIndex(context, index);
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  const Gap(24),
                  SizedBox(
                    width: double.infinity,
                    child: CupertinoButton(
                      onPressed: () => state.onSave(context),
                      color: AppColors.mainLight,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      borderRadius: BorderRadius.circular(20),
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
