import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend/screens/auth/login.dart';
import 'package:frontend/screens/nav/dashboard/dashboard.dart';
import 'package:frontend/screens/nav/mainnav.dart';
import 'package:frontend/screens/singleScreen/singleProject.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
          ),
          home: child,
        );
      },
      child: const MainNavPage(),
    );
  }
}
