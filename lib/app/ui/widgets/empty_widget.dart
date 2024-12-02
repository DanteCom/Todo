import 'package:gap/gap.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:todo/app/ui/theme/theme.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({
    super.key,
    required this.icon,
    required this.text,
    this.color,
  });
  final String icon;
  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          SvgPicture.asset(
            icon,
            // ignore: deprecated_member_use
            color: color,
            height: 80,
          ),
          const Gap(8),
          Text(
            text,
            textAlign: TextAlign.center,
            style: FontStyles.s14w500sf.copyWith(
              color: AppColors.grey40,
              height: 1.7,
            ),
          ),
        ],
      ),
    );
  }
}
