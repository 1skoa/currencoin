import 'package:crypto_coins_list/features/crypto_list/view/crypto_list_screen.dart';
import 'package:flutter/material.dart';

class CryptoSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return CryptoListScreen(searchQuery: query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return CryptoListScreen(searchQuery: query);
  }
}