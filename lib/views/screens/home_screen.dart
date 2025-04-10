import 'package:flutter/material.dart';
import '../../view_models/view_models.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final ViewModel vm = ViewModel();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: vm.ozbekMaqollar.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.all(8),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            // color: Colors.brown.shade100,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            vm.ozbekMaqollar[index],
            style: TextStyle(fontSize: vm.fontSize, color: vm.textColor),
          ),
        );
      },
    );
  }
}
