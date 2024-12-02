import 'package:gap/gap.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:todo/app/ui/theme/theme.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.text,
    required this.isActive,
    required this.onPressed,
    this.icon,
    this.disabledColor,
    this.borderRadius,
    this.color,
  });

  final String text;
  final Color? color;
  final String? icon;
  final bool isActive;
  final double? borderRadius;
  final Color? disabledColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      minSize: 0,
      onPressed: onPressed,
      color: color ?? Colors.transparent,
      disabledColor: disabledColor ?? AppColors.mainLight,
      borderRadius: BorderRadius.circular(borderRadius ?? 32),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null)
            SvgPicture.asset(
              icon!,
              // ignore: deprecated_member_use
              color: isActive ? AppColors.white : AppColors.grey40,
              width: 20,
              height: 20,
            ),
          if (icon != null) const Gap(5),
          Flexible(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: FontStyles.s16w500sf.copyWith(
                color: isActive ? AppColors.white : AppColors.grey40,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
