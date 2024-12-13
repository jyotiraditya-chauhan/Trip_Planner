import 'package:flutter/material.dart';
import 'package:trip_planner/common/export.dart';
import 'package:trip_planner/features/home/home_screen.dart';
import 'package:trip_planner/routes/routes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColor.cyan,
        colorScheme: ColorScheme(
            brightness: Brightness.dark,
            primary: AppColor.cyan,
            onPrimary: AppColor.cyan,
            secondary: AppColor.primaryGreen,
            onSecondary: Colors.blue,
            error: Colors.red,
            onError: Colors.red,
            surface: Colors.cyan,
            onSurface: Colors.black),
      ),
      initialRoute: Routes.home,
      routes: {
        Routes.home: (_) => const HomeScreen(),
      },
    );
  }
}
