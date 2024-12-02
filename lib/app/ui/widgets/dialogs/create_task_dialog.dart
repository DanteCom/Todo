import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo/app/ui/theme/theme.dart';
import 'package:todo/resources/resources.dart';
import 'package:todo/app/ui/widgets/widgets.dart';
import 'package:todo/app/domain/states/states.dart';
import 'package:todo/app/domain/models/models.dart';

class CreateTaskDialog extends StatelessWidget {
  const CreateTaskDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CreateTaskState>();
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
                color: AppColors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Add task', style: FontStyles.s18w600sf),
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
                  const Gap(10),
                  Container(
                    padding: const EdgeInsets.all(2.5),
                    decoration: BoxDecoration(
                      color: AppColors.grey8,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(
                        TaskCategory.values.length,
                        (index) => Expanded(
                          child: CustomTextButton(
                            borderRadius: 18,
                            text: state
                                .capitalize(TaskCategory.values[index].name),
                            isActive: state.categoryIndex == index,
                            onPressed: state.categoryIndex == index
                                ? null
                                : () {
                                    FocusScope.of(context).unfocus();
                                    state.changeCategoryIndex(index);
                                  },
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Gap(24),
                  Container(
                    padding: const EdgeInsets.all(2.5),
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
                  const Gap(24),
                  AppTextFiled(
                    hintText: 'Task name',
                    controller: state.controller,
                    keyboardType: TextInputType.name,
                    onChanged: (_) => state.setState(),
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
