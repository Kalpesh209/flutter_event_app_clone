import 'package:flutter/material.dart';
import 'package:flutter_event_app_clone/AppUtils/app_routes.dart';
import 'package:flutter_event_app_clone/AppUtils/app_strings.dart';
import 'package:flutter_event_app_clone/AppUtils/app_themes.dart';
import 'package:flutter_event_app_clone/Presentation/Screens/detail_screen.dart.dart';
import 'package:flutter_event_app_clone/Presentation/Screens/home_page_screen.dart.dart';
import 'package:flutter_event_app_clone/Presentation/Screens/ticket_screen.dart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme,
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case AppRoutes.homeScreen:
            return MaterialPageRoute(builder: (context) => HomePageScreen());
          case AppRoutes.detailScreen:
            return MaterialPageRoute(
              builder: (_) => const DetailScreen(),
              settings: settings,
            );
          case AppRoutes.ticketScreen:
            return MaterialPageRoute(
              builder: (context) => const TicketScreen(),
              settings: settings,
            );
          default:
            return MaterialPageRoute(builder: (context) => HomePageScreen());
        }
      },
    );
  }
}
