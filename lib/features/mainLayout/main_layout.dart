import 'package:fitness_app/features/mainLayout/tabs/explore/presentation/pages/explore_screen.dart';
import 'package:fitness_app/features/mainLayout/widgets/app_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
  ExploreScreen(),
   Text('ChatPage()') ,
   Text('GymPage()') ,
   Text('ProfilePage()') ,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: AppBottomNavBar(
        currentIndex: _currentIndex,
        onChanged: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}
