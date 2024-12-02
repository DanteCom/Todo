import 'package:gap/gap.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/app/ui/theme/theme.dart';
import 'package:todo/resources/resources.dart';
import 'package:todo/app/ui/routes/routes.dart';
import 'package:todo/app/ui/widgets/bottom_sheets.dart/bottom_sheet.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            'Settings',
            textAlign: TextAlign.center,
            style: FontStyles.s18w600sf,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.5),
          child: Center(
            child: Image.asset(
              Images.settings,
              height: 25.h,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Application settings',
              style: FontStyles.s16w500sf.copyWith(color: AppColors.grey40),
            ),
            const Gap(8),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(Vectors.comment),
                      const Gap(8),
                      const Text('Feedback', style: FontStyles.s18w600sf),
                      Text(
                        'Send feedback, suggestions,\nor bug reports.',
                        style: FontStyles.s14w500sf.copyWith(
                          color: AppColors.grey40,
                          height: 1.7,
                        ),
                      ),
                    ],
                  ),
                  CupertinoButton(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 29,
                    ),
                    color: AppColors.green,
                    borderRadius: BorderRadius.circular(16),
                    child: Text(
                      'Send',
                      style: FontStyles.s16w500sf.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        isDismissible: false,
                        isScrollControlled: true,
                        builder: (context) => const FeedbackBottomSheet(),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        const Gap(8),
        Row(
          children: [
            Expanded(
              child: CupertinoButton(
                onPressed: () => context.goNamed(RouteNames.privacy),
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16),
                padding: const EdgeInsets.all(16),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(Vectors.privacy),
                      const Gap(8),
                      const Text('Privacy Policy', style: FontStyles.s16w500sf)
                    ],
                  ),
                ),
              ),
            ),
            const Gap(8),
            Expanded(
              child: CupertinoButton(
                onPressed: () => context.goNamed(RouteNames.terms),
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16),
                padding: const EdgeInsets.all(16),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(Vectors.document),
                      const Gap(8),
                      const Text('Terms of Use', style: FontStyles.s16w500sf)
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        const Gap(16),
        SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'BalanceHer',
                style: FontStyles.s16w600sf.copyWith(color: AppColors.grey40),
              ),
              Text(
                'Version 0.1',
                style: FontStyles.s14w500sf.copyWith(color: AppColors.grey40),
              )
            ],
          ),
        ),
      ],
    );
  }
}
