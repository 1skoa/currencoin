import 'package:flutter/material.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/models/crypto_coin.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

class FavoritesProvider with ChangeNotifier {
  final List<CryptoCoin> _favoriteCoins = [];
  static const String _prefsKey = 'favoriteCoins';

  final Dio dio;

  FavoritesProvider({required this.dio});

  List<CryptoCoin> get favoriteCoins => _favoriteCoins;

  void addFavorite(CryptoCoin coin) {
    _favoriteCoins.add(coin);
    _saveFavorites();
    notifyListeners();
  }

  void removeFavorite(CryptoCoin coin) {
    _favoriteCoins.remove(coin);
    _saveFavorites();
    notifyListeners();
  }

  bool isFavorite(CryptoCoin coin) {
    return _favoriteCoins.contains(coin);
  }

  Future<void> _loadFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? favoriteCoinNames = prefs.getStringList(_prefsKey);
    if (favoriteCoinNames != null) {
      _favoriteCoins.clear();
      for (String name in favoriteCoinNames) {
        try {
          // Здесь можно использовать ваш репозиторий для загрузки реальных данных
          final response = await dio.get('https://api.example.com/coin/$name'); // Замените на реальный URL вашего API

          if (response.statusCode == 200) {
            final Map<String, dynamic> coinData = response.data;
            final double price = coinData['price']; // Замените на ключ, содержащий цену монеты
            final String imageUrl = coinData['image_url']; // Замените на ключ, содержащий URL изображения монеты

            _favoriteCoins.add(CryptoCoin(
              name: name,
              priceInUSD: price,
              imageUrl: imageUrl,
            ));
          }
        } catch (e) {
          print('Error loading favorite coin $name: $e');
        }
      }
    }
    notifyListeners();
  }

  Future<void> _saveFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favoriteCoinNames = _favoriteCoins.map((coin) => coin.name).toList();
    await prefs.setStringList(_prefsKey, favoriteCoinNames);
  }
}
