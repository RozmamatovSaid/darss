class SettingsModel {
  final bool isDarkMode;
  final double fontSize;
  final int textColor;
  final int backgroundColor;

  SettingsModel({
    required this.isDarkMode,
    required this.fontSize,
    required this.textColor,
    required this.backgroundColor,
  });

  Map<String, dynamic> toMap() {
    return {
      'isDarkMode': isDarkMode,
      'fontSize': fontSize,
      'textColor': textColor,
      'backgroundColor': backgroundColor,
    };
  }

  factory SettingsModel.fromMap(Map<String, dynamic> map) {
    return SettingsModel(
      isDarkMode: map['isDarkMode'],
      fontSize: map['fontSize'],
      textColor: map['textColor'],
      backgroundColor: map['backgroundColor'],
    );
  }
}
