import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/models/crypto_coin.dart';
import 'package:crypto_coins_list/features/crypto_list/bloc/crypto_list_bloc.dart';
import 'package:crypto_coins_list/features/crypto_list/widgets/crypto_coin_tile.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/abstract_coins_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptoListScreen extends StatefulWidget {
  final String? searchQuery;

  const CryptoListScreen({super.key, this.searchQuery});

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  late CryptoListBloc _cryptoListBloc;

  @override
  void initState() {
    super.initState();
    _cryptoListBloc = CryptoListBloc(GetIt.I<AbstractCoinsRepository>());
    _cryptoListBloc.add(LoadCryptoList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          _cryptoListBloc.add(LoadCryptoList());
        },
        child: BlocBuilder<CryptoListBloc, CryptoListState>(
          bloc: _cryptoListBloc,
          builder: (context, state) {
            if (state is CryptoListLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CryptoListLoaded) {
              final filteredCoins = widget.searchQuery == null || widget.searchQuery!.isEmpty
                  ? state.coinsList
                  : state.coinsList.where((coin) => coin.name.toLowerCase().contains(widget.searchQuery!.toLowerCase())).toList();
              return ListView.separated(
                padding: const EdgeInsets.only(top: 16),
                itemCount: filteredCoins.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  final coin = filteredCoins[index];
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
              );
            } else if (state is CryptoListLoadingFailure) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Something went wrong',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Text(
                      'Please try again later',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(fontSize: 16),
                    ),
                    const SizedBox(height: 30),
                    TextButton(
                      onPressed: () {
                        _cryptoListBloc.add(LoadCryptoList());
                      },
                      child: const Text('Try again'),
                    ),
                  ],
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _cryptoListBloc.close();
    super.dispose();
  }
}
