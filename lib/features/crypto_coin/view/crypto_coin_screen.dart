import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:crypto_coins_list/features/crypto_coin/bloc/crypto_coin_details/crypto_coin_details_bloc.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/abstract_coins_repository.dart';
import 'package:crypto_coins_list/features/crypto_coin/widgets/crypto_coin_details_tile.dart';

class CryptoCoinScreen extends StatefulWidget {
  final String currencyCode;

  const CryptoCoinScreen({super.key, required this.currencyCode});

  @override
  State<CryptoCoinScreen> createState() => _CryptoCoinScreenState();
}

class _CryptoCoinScreenState extends State<CryptoCoinScreen> {
  late CryptoCoinDetailsBloc _cryptoCoinDetailsBloc;

  @override
  void initState() {
    super.initState();
    _cryptoCoinDetailsBloc = CryptoCoinDetailsBloc(GetIt.I<AbstractCoinsRepository>());
    _cryptoCoinDetailsBloc.add(LoadCryptoCoinDetails(currencyCode: widget.currencyCode));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.currencyCode),
        leading: IconButton(

          icon: Icon(
              Icons.arrow_back,
              color: isDarkMode ? Colors.white : Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: BlocProvider(
        create: (context) => _cryptoCoinDetailsBloc,
        child: RefreshIndicator(
          onRefresh: () {
            final completer = Completer();
            _cryptoCoinDetailsBloc.add(LoadCryptoCoinDetails(currencyCode: widget.currencyCode));
            completer.complete();
            return completer.future;
          },
          child: BlocBuilder<CryptoCoinDetailsBloc, CryptoCoinDetailsState>(
            builder: (context, state) {
              if (state is CryptoCoinDetailsLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is CryptoCoinDetailsLoaded) {
                final coinDetails = state.coinDetails;
                return CryptoCoinDetailsTile(coinDetails: coinDetails);
              } else if (state is CryptoCoinDetailsLoadingFailure) {
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
                          _cryptoCoinDetailsBloc.add(LoadCryptoCoinDetails(currencyCode: widget.currencyCode));
                        },
                        child: const Text('Try again'),
                      ),
                    ],
                  ),
                );
              } else {
                return const Center(child: Text('Unknown state'));
              }
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _cryptoCoinDetailsBloc.close();
    super.dispose();
  }
}
