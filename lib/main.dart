import 'package:darss/utils/apptheme.dart';
import 'package:darss/view_models/view_models.dart';
import 'package:darss/views/screens/main_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ViewModel vm = ViewModel();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: vm.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      themeAnimationDuration: Duration(milliseconds: 250),
      themeAnimationCurve: Curves.easeInOut,
      debugShowCheckedModeBanner: false,
      home: MainScreen(reFresh: (){
        setState(() {

        });
      }),
    );
  }
}
