import 'package:gap/gap.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/app/ui/theme/theme.dart';
import 'package:todo/resources/resources.dart';
import 'package:todo/app/ui/widgets/widgets.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CupertinoButton(
                  onPressed: () => context.pop(),
                  child: SvgPicture.asset(
                    Vectors.arrowBack,
                    // ignore: deprecated_member_use
                    color: AppColors.mainLight,
                  ),
                ),
                const Text('Privacy Policy', style: FontStyles.s16w500sf),
                const Gap(56),
              ],
            ),
            const Gap(16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Text(
                    'The prohibited or acceptable use clause in your terms of use agreement outlines all rules your users must follow when accessing your services. Here is where you can list and ban behaviors and activities like:',
                    style: FontStyles.s14w500sf.copyWith(
                      height: 1.6,
                      color: AppColors.grey40,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                  const DotTextWidget(text: 'Obscene, crude, or violent posts'),
                  const DotTextWidget(text: 'False or misleading content'),
                  const DotTextWidget(text: 'Breaking the law'),
                  const DotTextWidget(
                    text: 'Spamming or scamming the service or other\nusers',
                  ),
                  const DotTextWidget(
                    text: 'Hacking or tampering with your website or app',
                  ),
                  const DotTextWidget(text: 'Violating copyright laws'),
                  const DotTextWidget(text: 'Harassing other users'),
                  const DotTextWidget(text: 'Stalking other users'),
                  Text(
                    'If your website or app gives users a lot of control and freedom while using your services, consider putting multiple use clauses within your terms of use.',
                    style: FontStyles.s14w500sf.copyWith(
                      height: 1.6,
                      color: AppColors.grey40,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
