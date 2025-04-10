import 'package:darss/view_models/view_models.dart';
import 'package:flutter/material.dart';

class ColorsItem extends StatelessWidget {
  ColorsItem({super.key, required this.onSelected});

  final ValueChanged<Color> onSelected;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Color>(
      icon: Icon(Icons.color_lens, color: Colors.black),
      onSelected: onSelected,
      itemBuilder:
          (BuildContext context) => [
            PopupMenuItem(value: Colors.red, child: Text('Qizil')),
            PopupMenuItem(value: Colors.green, child: Text('Yashil')),
            PopupMenuItem(value: Colors.blue, child: Text('Ko‘k')),
            PopupMenuItem(value: Colors.black, child: Text('Qora')),
          ],
    );
  }
}
