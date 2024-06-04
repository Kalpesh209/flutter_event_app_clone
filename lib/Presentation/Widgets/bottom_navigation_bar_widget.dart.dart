import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_event_app_clone/AppUtils/app_colors.dart';
import 'package:flutter_event_app_clone/Presentation/Screens/calender_screen.dart.dart';
import 'package:flutter_event_app_clone/Presentation/Screens/home_page_screen.dart.dart';
import 'package:flutter_event_app_clone/Presentation/Screens/profile_screen.dart.dart';
import 'package:flutter_event_app_clone/Presentation/Screens/ticket_screen.dart.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  State<BottomNavigationBarWidget> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<BottomNavigationBarWidget> {
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  int currentIndex = 0;
  final List<Widget> buildPages = [
    HomePageScreen(),
    const TicketScreen(),
    const CalendarScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      key: _bottomNavigationKey,
      index: 0,
      height: 60,
      backgroundColor: AppColors.backgroundColor,
      color: AppColors.primaryLightColor,
      buttonBackgroundColor: AppColors.primaryColor,
      letIndexChange: (index) => true,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 600),
      items: [
        _customIcons("assets/images/home.png", 34.0, 34.0),
        _customIcons("assets/images/ticket.png", 24.0, 24.0),
        _customIcons("assets/images/calendar.png", 24.0, 24.0),
        _customIcons("assets/images/profile.png", 24.0, 24.0),
      ],
      onTap: (int index) {
        // setState(() {
        //   print('Tapped index: $index');
        //
        //   currentIndex = index;
        // });

        //by vineet
        if (index == 2) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const CalendarScreen()));
        } else if (index == 3) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ProfileScreen()));
        }
      },
    );
  }
}

Widget _customIcons(String imagePath, double width, double height) {
  return Image.asset(
    imagePath,
    width: width,
    height: height,
  );
}
