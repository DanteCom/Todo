import 'package:flutter/material.dart';
import 'app_colors.dart';

abstract class FontStyles {
  static const s32w700sf = TextStyle(
    fontSize: 32,
    color: AppColors.black,
    fontFamily: '.SF Pro Text',
    fontWeight: FontWeight.w700,
    overflow: TextOverflow.ellipsis,
  );

  static const s18w600sf = TextStyle(
    fontSize: 18,
    color: AppColors.black,
    fontFamily: '.SF Pro Text',
    fontWeight: FontWeight.w600,
    overflow: TextOverflow.ellipsis,
  );

  static const s16w600sf = TextStyle(
    fontSize: 16,
    color: AppColors.black,
    fontFamily: '.SF Pro Text',
    fontWeight: FontWeight.w600,
    overflow: TextOverflow.ellipsis,
  );

  static const s16w500sf = TextStyle(
    fontSize: 16,
    color: AppColors.black,
    fontFamily: '.SF Pro Text',
    fontWeight: FontWeight.w500,
    overflow: TextOverflow.ellipsis,
  );

  static const s14w500sf = TextStyle(
    fontSize: 14,
    color: AppColors.black,
    fontFamily: '.SF Pro Text',
    fontWeight: FontWeight.w500,
    overflow: TextOverflow.ellipsis,
  );
}
