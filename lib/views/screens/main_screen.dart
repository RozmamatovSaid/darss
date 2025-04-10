import 'package:darss/view_models/view_models.dart';
import 'package:darss/views/screens/settings_screen.dart';
import 'package:darss/views/widgets/app_bar_widget.dart';
import 'package:darss/views/screens/home_screen.dart';
import 'package:darss/views/widgets/icon_button_item.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainScreen extends StatefulWidget {
  Function reFresh;

  MainScreen({super.key, required this.reFresh});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  ViewModel vm = ViewModel();

  Future<void> saveData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("theme", vm.isDarkMode);
    prefs.setDouble("fontSize", vm.fontSize);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: vm.backgroundColor,
      appBar: AppBarWidget(currentIndex: _currentIndex),
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          HomeScreen(),
          NightModeScreen(reFresh: widget.reFresh),
          // TextModeScreen(),
        ],
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.brown,
          border: Border.all(color: Colors.brown, width: 2),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButtonItem(
              icon: Icon(
                Icons.home_filled,
                color: _currentIndex == 0 ? Colors.black : Colors.white,
              ),
              title: 'Home',
              onPressed: () => _onItemTapped(0),
            ),
            IconButtonItem(
              icon: Icon(
                Icons.settings,
                color: _currentIndex == 1 ? Colors.black : Colors.white,
              ),
              title: 'Settings',
              onPressed: () => _onItemTapped(1),
            ),
          ],
        ),
      ),
    );
  }
}
