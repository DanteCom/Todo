import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../../../resources/resources.dart';
import '../../theme/app_colors.dart';
import '../../../domain/states/tabbar_state.dart';

class TabbarScreen extends StatelessWidget {
  const TabbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<TabbarState>();
    return Scaffold(
      extendBody: true,
      body: SafeArea(
        bottom: false,
        child: ListView(
          physics: const RangeMaintainingScrollPhysics(),
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 130),
          children: [
            AnimatedSwitcher(
              duration: kThemeAnimationDuration,
              child: state.pages.elementAt(state.currentPage),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 37, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TabsButton(
                icon: Vectors.home,
                color: AppColors.blue,
                isActive: state.currentPage == 0,
                onPressed: () => state.onTabPress(0),
              ),
              TabsButton(
                icon: Vectors.heart,
                color: AppColors.main,
                isActive: state.currentPage == 1,
                onPressed: () => state.onTabPress(1),
              ),
              TabsButton(
                icon: Vectors.run,
                color: AppColors.purple,
                isActive: state.currentPage == 2,
                onPressed: () => state.onTabPress(2),
              ),
              TabsButton(
                icon: Vectors.settings,
                color: AppColors.green,
                isActive: state.currentPage == 3,
                onPressed: () => state.onTabPress(3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TabsButton extends StatelessWidget {
  const TabsButton({
    super.key,
    required this.icon,
    required this.color,
    required this.isActive,
    required this.onPressed,
  });

  final String icon;
  final Color color;
  final bool isActive;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      borderRadius: BorderRadius.circular(20),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      color: isActive ? color : AppColors.white,
      child: SvgPicture.asset(
        icon,
        // ignore: deprecated_member_use
        color: isActive ? null : AppColors.grey40,
      ),
    );
  }
}
