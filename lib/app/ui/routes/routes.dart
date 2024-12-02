import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/app/ui/screens/screens.dart';

abstract class RouteNames {
  static const terms = 'terms';
  static const splash = 'splash';
  static const tabbar = 'tabbar';
  static const privacy = 'privacy';
  static const onboarding = 'onboarding';
}

class AppRoutes {
  static final appRoutes = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: RouteNames.splash,
        pageBuilder: (context, state) => transitionWithoutAnimation(
          state: state,
          context: context,
          child: const SplashScreen(),
        ),
      ),
      GoRoute(
        path: '/onboarding',
        name: RouteNames.onboarding,
        pageBuilder: (context, state) => transitionWithoutAnimation(
          state: state,
          context: context,
          child: const OnboardScreen(),
        ),
      ),
      GoRoute(
        path: '/tabbar',
        name: RouteNames.tabbar,
        pageBuilder: (context, state) => transitionWithoutAnimation(
          state: state,
          context: context,
          child: const TabbarScreen(),
        ),
        routes: [
          GoRoute(
            path: 'privacy',
            name: RouteNames.privacy,
            pageBuilder: (context, state) => transitionFromAnimation(
              state: state,
              context: context,
              child: const PrivacyPolicyScreen(),
            ),
          ),
          GoRoute(
            path: 'terms',
            name: RouteNames.terms,
            pageBuilder: (context, state) => transitionFromAnimation(
              state: state,
              context: context,
              child: const TermsOfUseScreen(),
            ),
          ),
        ],
      ),
    ],
  );

  static void popUntilPath(String routeName, BuildContext context) {
    final router = GoRouter.of(context);
    while (router.namedLocation(routeName) != routeName) {
      if (!router.canPop()) return;

      router.pop();
    }
  }
}

CustomTransitionPage transitionWithoutAnimation<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionDuration: Duration.zero,
    reverseTransitionDuration: Duration.zero,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(opacity: animation, child: child);
    },
  );
}

CupertinoPage transitionFromAnimation<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CupertinoPage<T>(child: child);
}
