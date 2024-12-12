import 'package:flutter/material.dart';
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
      initialRoute: Routes.home,
      routes: {
        Routes.home: (_) => const HomeScreen(),
      },
    );
  }
}
