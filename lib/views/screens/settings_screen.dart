import 'package:darss/view_models/view_models.dart';
import 'package:darss/views/widgets/colors_item.dart';
import 'package:darss/views/widgets/text_item.dart';
import 'package:flutter/material.dart';

class NightModeScreen extends StatefulWidget {
  Function reFresh;

  NightModeScreen({super.key, required this.reFresh});

  @override
  State<NightModeScreen> createState() => _NightModeScreenState();
}

class _NightModeScreenState extends State<NightModeScreen> {
  ViewModel vm = ViewModel();

  @override
  void initState() {
    super.initState();
    vm.getSettings().then((_) {
      setState(() {});
      print(
        "Saving settings: Dark Mode: ${vm.isDarkMode}, Font Size: ${vm.fontSize}, Text Color: ${vm.textColor.value}, Background Color: ${vm.backgroundColor.value}",
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          Row(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextItem(
                text:
                    vm.isDarkMode
                        ? "This is night mode:"
                        : "This is the light mode:",
              ),
              Switch(
                value: vm.isDarkMode,
                onChanged: (value) {
                  setState(() {
                    vm.isDarkMode = value;
                    vm.saveSettings();
                  });
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextItem(text: "Font size: "),
              Slider(
                value: vm.fontSize,
                min: 14,
                max: 48,
                onChanged: (double newValue) {
                  setState(() {
                    vm.fontSize = newValue;
                    vm.saveSettings();
                  });
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextItem(text: "Change text colors"),
              ColorsItem(
                onSelected: (Color color) {
                  setState(() {
                    vm.textColor = color;
                    vm.saveSettings();
                  });
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextItem(text: "Change background colors"),
              ColorsItem(
                onSelected: (Color backgroundColor) {
                  setState(() {
                    vm.backgroundColor = backgroundColor;
                    vm.saveSettings();
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
