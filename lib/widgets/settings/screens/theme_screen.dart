import 'package:crypto_coins_list/widgets/theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeScreen extends StatelessWidget {
  const ThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Темы'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildListTile(context, 'Светлая тема', ThemeType.light),
          _buildListTile(context, 'Темная тема', ThemeType.dark),
          _buildListTile(context, 'Системная тема', ThemeType.system),
        ],
      ),
    );
  }

  Widget _buildListTile(BuildContext context, String title, ThemeType type) {
    final notifier = Provider.of<ThemeNotifier>(context);
    return ListTile(
      title: Text(title),
      onTap: () {
        notifier.setThemeMode(type);
      },
      trailing: notifier.themeMode == ThemeMode.system
          ? null
          : notifier.themeMode == ThemeMode.light && type == ThemeType.light
          ? const Icon(Icons.check)
          : notifier.themeMode == ThemeMode.dark && type == ThemeType.dark
          ? const Icon(Icons.check)
          : null,
    );
  }
}