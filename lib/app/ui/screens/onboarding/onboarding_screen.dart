import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:todo/app/ui/theme/theme.dart';
import 'package:todo/app/domain/states/states.dart';
import 'package:todo/resources/resources.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<OnboardState>();
    final pages = state.pages;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: AnimatedSwitcher(
                duration: kThemeAnimationDuration,
                child: state.pages.elementAt(state.currentPage),
              ),
            ),
            Positioned(
              bottom: 67,
              left: 95,
              right: 95,
              child: CupertinoButton(
                color: AppColors.mainLight,
                onPressed: () => state.onNext(context),
                borderRadius: BorderRadius.circular(32),
                padding: EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: state.currentPage == pages.length - 1 ? 23 : 45,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      state.currentPage == pages.length - 1
                          ? 'Get started'
                          : 'Next',
                      style: FontStyles.s16w600sf.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                    const Spacer(),
                    SvgPicture.asset(
                      Vectors.arrowRight,
                      width: 24,
                      height: 24,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
