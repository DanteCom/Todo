import 'ui/routes/routes.dart';
import 'ui/theme/app_theme.dart';
import 'package:sizer/sizer.dart';
import 'domain/states/states.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => HomeState()),
            ChangeNotifierProvider(create: (context) => HealthState()),
            ChangeNotifierProvider(create: (context) => HabitsState()),
            ChangeNotifierProvider(create: (context) => OnboardState()),
            ChangeNotifierProvider(create: (context) => TabbarState()),
          ],
          child: MaterialApp.router(
            theme: AppTheme.appTheme,
            routerConfig: AppRoutes.appRoutes,
            debugShowCheckedModeBanner: false,
          ),
        );
      },
    );
  }
}
