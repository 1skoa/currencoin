import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/abstract_coins_repository.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/models/crypto_coin_details.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'crypto_coin_details_event.dart';
part 'crypto_coin_details_state.dart';

class CryptoCoinDetailsBloc extends Bloc<CryptoCoinDetailsEvent, CryptoCoinDetailsState> {
  final AbstractCoinsRepository coinsRepository;

  CryptoCoinDetailsBloc(this.coinsRepository) : super(CryptoCoinDetailsInitial()) {
    on<LoadCryptoCoinDetails>(_onLoadCryptoCoinDetails);
  }

  Future<void> _onLoadCryptoCoinDetails(
      LoadCryptoCoinDetails event, Emitter<CryptoCoinDetailsState> emit) async {
    emit(CryptoCoinDetailsLoading());
    try {
      final coinDetails = await coinsRepository.getCoinDetails(event.currencyCode);
      emit(CryptoCoinDetailsLoaded(coinDetails: coinDetails));
    } catch (e) {
      emit(CryptoCoinDetailsLoadingFailure(error: e.toString()));
    }
  }
}
