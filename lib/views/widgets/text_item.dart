import 'package:darss/view_models/view_models.dart';
import 'package:flutter/material.dart';

class TextItem extends StatelessWidget {
  TextItem({super.key, required this.text});

  final String text;
  ViewModel vm = ViewModel();

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      // overflow: TextOverflow.ellipsis,
      style: TextStyle(fontSize: vm.fontSize, color: vm.textColor),
    );
  }
}
