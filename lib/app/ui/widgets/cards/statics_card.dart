import 'package:gap/gap.dart';
import 'package:flutter/cupertino.dart';
import 'package:todo/app/ui/theme/theme.dart';
import 'package:todo/app/ui/widgets/widgets.dart';

class StaticsCard extends StatelessWidget {
  const StaticsCard({
    super.key,
    required this.name,
    required this.title,
    required this.subtitle,
    this.width,
    this.height,
  });

  final String name;
  final String title;
  final double? width;
  final double? height;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: FontStyles.s14w500sf.copyWith(color: AppColors.grey40),
          ),
          const Gap(8),
          AppRichText(title: title, subtitle: subtitle),
        ],
      ),
    );
  }
}
