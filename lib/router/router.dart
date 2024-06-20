import 'package:flutter/material.dart';
import 'package:crypto_coins_list/features/crypto_coin/crypto_coin.dart';
import 'package:crypto_coins_list/features/crypto_list/crypto_list.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/models/crypto_coin.dart';

final routes = {
    '/coin': (context) {
        final args = ModalRoute.of(context)!.settings.arguments;

        if (args is CryptoCoin) {
            print('$args');
            return CryptoCoinScreen(currencyCode: args.name);
        } else {
            return const Scaffold(
                body: Center(
                    child: Text('Error: Invalid arguments for CryptoCoinScreen'),
                ),
            );
        }
    },
};
