import 'package:flutter/material.dart';
import 'package:insurance/routes/route.dart';
import 'package:insurance/routes/routes_name.dart';
import 'package:insurance/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Application',
      debugShowCheckedModeBanner: false,
      theme: lightTheme(), // Apply the centralized light theme
      initialRoute:
          RouteNames.dashBoardScreen, // Set the initial route to SplashScreen
      onGenerateRoute:
          Routes.generateRoute, // Link to your generateRoute function
      // routerConfig: appRouter,
    );
  }
}
