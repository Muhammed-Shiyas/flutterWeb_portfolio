import 'package:flutter/material.dart';
import 'package:portfolio/lockSceen/lock_Wallpapper.dart';
import 'package:portfolio/lockSceen/lock_screen_password.dart';

class LockScreen extends StatefulWidget {
  const LockScreen({super.key});

  @override
  State<LockScreen> createState() => _LockScreenState();
}

class _LockScreenState extends State<LockScreen> {
  final PageController _pageController = PageController(
    viewportFraction: 1.0, // Make sure each page occupies the full height
  );
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: GestureDetector(
          onTap: () {
            if (_currentPageIndex < 1) {
              _pageController.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeOut,
              );
            } else {
              // Optionally, reset to the first page after reaching the last page
            }
          },
          child: PageView(
            controller: _pageController,
            scrollDirection:
                Axis.vertical, // Change scroll direction to vertical
            // Reverse the order of pages
            onPageChanged: (index) {
              setState(() {
                _currentPageIndex = index;
              });
            },
            children: const [
              LockWallpaper(),
              LockPassword(),
            ],
          ),
        ),
      ),
    );
  }
}
