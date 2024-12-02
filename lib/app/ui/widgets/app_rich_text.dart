import 'package:flutter/cupertino.dart';
import 'package:todo/app/ui/theme/theme.dart';

class AppRichText extends StatelessWidget {
  const AppRichText({
    super.key,
    required this.title,
    required this.subtitle,
  });
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return RichText(
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(text: title, style: FontStyles.s32w700sf),
          TextSpan(
            children: [
              TextSpan(
                text: ' $subtitle',
                style: FontStyles.s16w600sf.copyWith(color: AppColors.grey40),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
