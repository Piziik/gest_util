import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  final ValueNotifier<Color> appBarColorNotifier;

  SettingsScreen({required this.appBarColorNotifier});

  final Map<String, Color> colors = {
    'Red': Colors.red,
    'Green': Colors.green,
    'Blue': Colors.blue,
    'Yellow': Colors.yellow,
    'Violet': Colors.purple,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'Changer le thème',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: colors.keys.map((String key) {
                return RadioListTile<Color>(
                  title: Text(key),
                  value: colors[key]!,
                  groupValue: appBarColorNotifier.value,
                  onChanged: (Color? value) {
                    if (value != null) {
                      appBarColorNotifier.value = value;
                    }
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
