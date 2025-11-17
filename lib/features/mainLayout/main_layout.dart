import 'package:fitness_app/features/mainLayout/tabs/explore/presentation/pages/explore_screen.dart';
import 'package:fitness_app/features/mainLayout/tabs/workouts/presentation/pages/work_outs_screen.dart';
import 'package:fitness_app/features/mainLayout/widgets/app_bottom_nav_bar.dart';
import 'package:fitness_app/features/profileMain/presentation/pages/profile_screen.dart';
import 'package:flutter/material.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key, required this.initialIndex});
  final int initialIndex;

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _currentIndex = 0;
  @override
  void initState() {
    _currentIndex = widget.initialIndex;
    super.initState();
  }

  final List<Widget> _pages = const [
    ExploreScreen(),
    Text('ChatPage()'),
    WorkOutsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _pages[_currentIndex],
      bottomNavigationBar: AppBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}
