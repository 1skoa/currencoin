import 'package:crypto_coins_list/features/crypto_list/widgets/crypto_coin_tile.dart';
import 'package:crypto_coins_list/providers/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);
    final favoriteCoins = favoritesProvider.favoriteCoins;

    return Scaffold(
      body: ListView.builder(
        itemCount: favoriteCoins.length,
        itemBuilder: (context, index) {
          final coin = favoriteCoins[index];
          return CryptoCoinTile(
            coin: coin,
            onTap: () {
              Navigator.of(context).pushNamed(
                '/coin',
                arguments: coin,
              );
            },
          );
        },
      ),
    );
  }
}
