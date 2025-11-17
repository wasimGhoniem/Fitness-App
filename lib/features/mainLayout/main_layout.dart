import 'package:fitness_app/features/aiChat/presentation/pages/ai_screen.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/presentation/pages/explore_screen.dart';
import 'package:fitness_app/features/mainLayout/tabs/workouts/presentation/pages/work_outs_screen.dart';
import 'package:fitness_app/features/mainLayout/widgets/app_bottom_nav_bar.dart';
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
    AiScreen(),
    WorkOutsScreen(),
    Text('ProfilePage()'),
  ];
  bool _showNavBar(int index) {
    return index != 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _pages[_currentIndex],
      bottomNavigationBar: _showNavBar(_currentIndex)
          ? AppBottomNavBar(
              currentIndex: _currentIndex,
              onTap: (index) => setState(() => _currentIndex = index),
            )
          : null,
    );
  }
}
