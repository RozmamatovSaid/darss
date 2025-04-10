import 'package:flutter/material.dart';

class IconButtonItem extends StatelessWidget {
  const IconButtonItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onPressed,
  });

  final Widget icon;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: icon,
          color: Colors.white,
          iconSize: 28,
        ),
        Text(title, style: TextStyle(color: Colors.white, fontSize: 12)),
      ],
    );
  }
}
