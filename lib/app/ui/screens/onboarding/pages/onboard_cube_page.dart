import 'package:gap/gap.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:todo/app/ui/theme/theme.dart';
import 'package:todo/resources/resources.dart';

class OnboardCubePage extends StatelessWidget {
  const OnboardCubePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(flex: 2),
        Image.asset(
          height: 30.h,
          fit: BoxFit.cover,
          Images.onboardCube,
        ),
        const Spacer(),
        const Text(
          'Welcome to\nBalanceHer!',
          style: FontStyles.s32w700sf,
          textAlign: TextAlign.center,
          overflow: TextOverflow.clip,
        ),
        const Gap(16),
        Text(
          'Your assistant in creating\nharmony and development!',
          style: FontStyles.s16w500sf.copyWith(color: AppColors.grey40),
          textAlign: TextAlign.center,
          overflow: TextOverflow.clip,
        ),
        const Spacer(flex: 3),
      ],
    );
  }
}
