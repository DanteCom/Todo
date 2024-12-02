import 'package:gap/gap.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:todo/app/ui/theme/theme.dart';
import 'package:todo/resources/resources.dart';

class OnboardStarPage extends StatelessWidget {
  const OnboardStarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(flex: 2),
        Image.asset(
          height: 30.h,
          fit: BoxFit.cover,
          Images.onboardStar,
        ),
        const Spacer(),
        const Text(
          'Feature overview',
          style: FontStyles.s32w700sf,
          textAlign: TextAlign.center,
          overflow: TextOverflow.clip,
        ),
        const Gap(16),
        const IconAndTextWidget(
          icon: Vectors.cubeCheck,
          text: 'Task scheduling',
        ),
        const Padding(
          padding: EdgeInsets.all(4.0),
          child: IconAndTextWidget(
            icon: Vectors.heartRed,
            text: 'Health tracker',
          ),
        ),
        const IconAndTextWidget(
          icon: Vectors.bookPurple,
          text: 'Habit tracking',
        ),
        const Spacer(flex: 3),
      ],
    );
  }
}

class IconAndTextWidget extends StatelessWidget {
  const IconAndTextWidget({
    super.key,
    required this.text,
    required this.icon,
  });
  final String text;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(icon),
        const Gap(8),
        Text(text, style: FontStyles.s16w500sf),
      ],
    );
  }
}
