import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend/components/bottomnav.dart';
import 'package:frontend/screens/nav/dashboard/dashboard.dart';
import 'package:frontend/screens/nav/tickets/alltickets.dart';

class MainNavPage extends StatefulWidget {
  const MainNavPage({super.key});

  @override
  State<MainNavPage> createState() => _MainNavPageState();
}

class _MainNavPageState extends State<MainNavPage> {
  int currentIndex = 0;
  bool isDrawerOpen = false;
  late List<Widget> screens;

  @override
  void initState() {
    super.initState();
  }

  void onTabChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    screens = [
      DashBoard(),
      AllTickets()
    ];
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: Bottomnav(
          selectedIndex: currentIndex,
          onTabSelected: onTabChanged,
        ),
        body: screens[currentIndex],

      ),
    );
  }
}
