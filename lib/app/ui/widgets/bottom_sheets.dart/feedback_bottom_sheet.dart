import 'package:gap/gap.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/app/ui/theme/theme.dart';
import 'package:todo/resources/resources.dart';

class FeedbackBottomSheet extends StatefulWidget {
  const FeedbackBottomSheet({super.key});

  @override
  State<FeedbackBottomSheet> createState() => _FeedbackBottomSheetState();
}

class _FeedbackBottomSheetState extends State<FeedbackBottomSheet> {
  final _feedbackController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Gap(8),
                Container(
                  width: 40,
                  height: 8,
                  decoration: BoxDecoration(
                    color: AppColors.grey8,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Feedback', style: FontStyles.s18w600sf),
                      CupertinoButton(
                        onPressed: () => context.pop(),
                        padding: EdgeInsets.zero,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.grey8,
                          ),
                          child: SvgPicture.asset(Vectors.close),
                        ),
                      ),
                    ],
                  ),
                ),
                Stack(
                  children: [
                    TextField(
                      controller: _feedbackController,
                      inputFormatters: [LengthLimitingTextInputFormatter(100)],
                      style: FontStyles.s16w500sf,
                      onChanged: (_) => setState(() {}),
                      cursorColor: AppColors.main,
                      maxLines: 6,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(16),
                        hintText: 'Text',
                        filled: true,
                        fillColor: AppColors.grey8,
                        hintStyle: FontStyles.s16w500sf.copyWith(
                          color: AppColors.grey40,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 16,
                      bottom: 12,
                      child: Text(
                        '${_feedbackController.text.length}/100',
                        style: FontStyles.s14w500sf.copyWith(
                          color: AppColors.grey40,
                        ),
                      ),
                    ),
                  ],
                ),
                const Gap(20),
                SizedBox(
                  width: double.infinity,
                  child: CupertinoButton(
                    padding: const EdgeInsets.symmetric(
                      vertical: 14,
                    ),
                    onPressed: () {},
                    color: AppColors.mainLight,
                    borderRadius: BorderRadius.circular(16),
                    child: Text(
                      'Send',
                      style: FontStyles.s16w500sf.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
                const Gap(40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
