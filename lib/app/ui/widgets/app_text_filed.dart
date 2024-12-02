import 'package:flutter/material.dart';
import 'package:todo/app/ui/theme/theme.dart';

class AppTextFiled extends StatelessWidget {
  const AppTextFiled({
    super.key,
    required this.hintText,
    required this.onChanged,
    required this.controller,
    required this.keyboardType,
  });
  final String hintText;
  final TextInputType keyboardType;
  final Function(String) onChanged;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: AppColors.grey8,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextField(
        onChanged: onChanged,
        controller: controller,
        textAlign: TextAlign.center,
        cursorColor: AppColors.main,
        keyboardType: keyboardType,
        style: FontStyles.s16w500sf,
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: const EdgeInsets.symmetric(vertical: 12),
          hintStyle: FontStyles.s16w500sf.copyWith(color: AppColors.grey40),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
