import 'package:crypto_coins_list/features/checkers/update_checker.dart';
import 'package:crypto_coins_list/router/router.dart';
import 'package:crypto_coins_list/widgets/google_bottom_bar.dart';
import 'package:crypto_coins_list/widgets/theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CryptoCurrenciesListApp extends StatelessWidget {
  const CryptoCurrenciesListApp({super.key});
  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (context) => ThemeNotifier(),
      child: Consumer<ThemeNotifier>(
        builder: (context, notifier, child) {
          return FutureBuilder(
            future: _initializeApp(context),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return MaterialApp(
                  title: 'Currencoin',
                  darkTheme: ThemeData.dark(),
                  theme: ThemeData.light(),
                  themeMode: notifier.themeMode,
                  initialRoute: '/',
                  routes: routes,
                  home: const GoogleBottomBar(),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          );
        },
      ),
    );
  }

  Future<void> _initializeApp(BuildContext context) async {

  }
}