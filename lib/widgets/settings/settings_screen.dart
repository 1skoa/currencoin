import 'package:crypto_coins_list/widgets/settings/screens/about_screen.dart';
import 'package:crypto_coins_list/widgets/settings/screens/theme_screen.dart';
import 'package:crypto_coins_list/widgets/theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Настройки'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ListTile(
            leading: const Icon(Icons.color_lens),
            title: const Text('Темы'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const ThemeScreen()),
              );
            },
            trailing: const Icon(Icons.arrow_forward),
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('О программе'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const AboutScreen()),
              );
            },
            trailing: const Icon(Icons.arrow_forward),
          ),
        ],
      ),
    );
  }
}
