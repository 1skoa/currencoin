import 'package:crypto_coins_list/features/checkers/update_checker.dart';
import 'package:crypto_coins_list/features/crypto_list/crypto_list.dart';
import 'package:crypto_coins_list/features/crypto_list/widgets/crypto_search_delegate.dart';
import 'package:crypto_coins_list/widgets/favorite_screen.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'settings/settings_screen.dart';

class GoogleBottomBar extends StatefulWidget {
  const GoogleBottomBar({super.key});

  @override
  State<GoogleBottomBar> createState() => _GoogleBottomBarState();
}

class _GoogleBottomBarState extends State<GoogleBottomBar> {
  int _selectedIndex = 0;

  final List<String> _appBarTitles = [
    'Список монет',
    'Избранное',
    'Search',
    'Profile',
  ];

  @override
  Widget build(BuildContext context) {
    checkForUpdates(context);
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    final _navBarItems = [
      SalomonBottomBarItem(
        icon: const Icon(Icons.home),
        title: const Text("Cryptoin"),
        selectedColor: isDarkMode ? Colors.purpleAccent : Colors.purple,
      ),
      SalomonBottomBarItem(
        icon: const Icon(Icons.favorite_border),
        title: const Text("Избранное"),
        selectedColor: isDarkMode ? Colors.pinkAccent : Colors.pink,
      ),
      // SalomonBottomBarItem(
      //   icon: const Icon(Icons.search),
      //   title: const Text("Search"),
      //   selectedColor: isDarkMode ? Colors.orangeAccent : Colors.orange,
      // ),
      // SalomonBottomBarItem(
      //   icon: const Icon(Icons.person),
      //   title: const Text("Profile"),
      //   selectedColor: isDarkMode ? Colors.blueAccent : Colors.blue,
      // ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitles[_selectedIndex]),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: CryptoSearchDelegate(),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
            },
          ),
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: const [
          CryptoListScreen(),
          FavoritesScreen(),
          // Placeholder(),
          // Placeholder(),
        ],
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _selectedIndex,
        selectedItemColor: isDarkMode ? Colors.amber : Colors.purple,
        unselectedItemColor: const Color(0xff757575),
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: _navBarItems,
      ),
    );
  }
}
