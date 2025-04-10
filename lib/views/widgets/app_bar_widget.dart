import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key, required int currentIndex})
    : _currentIndex = currentIndex;

  final int _currentIndex;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        _currentIndex == 0
            ? "Home"
            : _currentIndex == 1
            ? "Night mode"
            : _currentIndex == 2
            ? "Text mode"
            : _currentIndex == 3
            ? "Pin code"
            : "",
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 50);
}
