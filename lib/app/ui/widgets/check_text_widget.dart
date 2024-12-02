import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:todo/app/ui/theme/theme.dart';

class CheckTextWidget extends StatelessWidget {
  const CheckTextWidget({
    super.key,
    required this.text,
    required this.isActive,
    required this.onPressed,
    required this.onChanged,
  });
  final String text;
  final bool isActive;
  final VoidCallback onPressed;
  final Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 11),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 24,
                height: 24,
                child: Checkbox(
                  value: isActive,
                  activeColor: AppColors.blue,
                  side: BorderSide(color: AppColors.grey40, width: 2.3),
                  hoverColor: AppColors.purple,
                  onChanged: (newValue) => onChanged(newValue ?? false),
                ),
              ),
              const Gap(8),
              Expanded(
                child: Text(
                  text,
                  style: isActive
                      ? FontStyles.s16w500sf.copyWith(
                          color: AppColors.grey40,
                          decoration:
                              isActive ? TextDecoration.lineThrough : null,
                          decorationColor: AppColors.grey40,
                        )
                      : FontStyles.s16w500sf,
                ),
              ),
              if (isActive)
                Row(
                  children: [
                    const Gap(8),
                    CupertinoButton(
                      minSize: 0,
                      onPressed: onPressed,
                      padding: EdgeInsets.zero,
                      child: const Icon(Icons.close, color: AppColors.main),
                    ),
                  ],
                )
            ],
          ),
          Divider(
            height: 12,
            indent: 32,
            endIndent: isActive ? 32 : 0,
            color: AppColors.grey40,
          ),
        ],
      ),
    );
  }
}
