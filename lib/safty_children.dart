import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safty_children/core/routing/app_router.dart';
import 'package:safty_children/core/routing/routes.dart';

class SaftyChildren extends StatelessWidget {
  const SaftyChildren({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Safty Children',
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.home,
          onGenerateRoute: AppRouter.onGenerateRoute,
        );
      },
    );
  }
}
