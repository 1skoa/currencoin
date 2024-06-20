import 'package:crypto_coins_list/features/checkers/update_checker.dart';
import 'package:crypto_coins_list/providers/favorite_provider.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/abstract_coins_repository.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/crypto_coins_repository.dart';
import 'package:crypto_coins_list/theme/theme.dart';
import 'package:crypto_coins_list/widgets/google_bottom_bar.dart';
import 'package:crypto_coins_list/widgets/theme_notifier.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'crypto_coins_list_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  GetIt.I.registerLazySingleton<AbstractCoinsRepository>(() => CryptoCoinsRepository(dio: Dio()));

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeNotifier()),
        Provider<AbstractCoinsRepository>(
          create: (_) => GetIt.I<AbstractCoinsRepository>(),
        ),
        ChangeNotifierProvider(
          create: (context) => FavoritesProvider(dio: Dio()),
        ),
      ],
      child: const CryptoCurrenciesListApp(),
    ),
  );
}
