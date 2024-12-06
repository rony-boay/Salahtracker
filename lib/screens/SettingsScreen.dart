import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  final Function toggleTheme;
  final bool isDarkTheme;

  const SettingsScreen({required this.toggleTheme, required this.isDarkTheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: SwitchListTile(
          title: Text("Dark Theme"),
          value: isDarkTheme,
          onChanged: (bool value) {
            toggleTheme();
          },
        ),
      ),
    );
  }
}
