import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:todo/app/ui/theme/theme.dart';

class DotTextWidget extends StatelessWidget {
  const DotTextWidget({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Gap(10),
        Column(
          children: [
            const Gap(6),
            Icon(
              Icons.circle,
              size: 8,
              color: AppColors.grey40,
            ),
          ],
        ),
        const Gap(10),
        Flexible(
          child: Text(
            text,
            style: FontStyles.s14w500sf.copyWith(
              color: AppColors.grey40,
              height: 1.5,
            ),
            overflow: TextOverflow.clip,
          ),
        ),
      ],
    );
  }
}
