import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:todo/app/ui/theme/theme.dart';
import 'package:todo/resources/resources.dart';

class OnboardCirclePage extends StatelessWidget {
  const OnboardCirclePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(flex: 2),
        Image.asset(
          height: 30.h,
          fit: BoxFit.cover,
          Images.onboardCircle,
        ),
        const Spacer(),
        const Text(
          'Start your journey to\nharmony today!',
          style: FontStyles.s32w700sf,
          textAlign: TextAlign.center,
          overflow: TextOverflow.clip,
        ),
        const Spacer(flex: 3),
      ],
    );
  }
}
