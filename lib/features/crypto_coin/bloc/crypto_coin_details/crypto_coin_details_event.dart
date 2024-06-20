part of 'crypto_coin_details_bloc.dart';

abstract class CryptoCoinDetailsEvent extends Equatable {
  const CryptoCoinDetailsEvent();

  @override
  List<Object> get props => [];
}

class LoadCryptoCoinDetails extends CryptoCoinDetailsEvent {
  final String currencyCode;
  const LoadCryptoCoinDetails({required this.currencyCode});

  @override
  List<Object> get props => [currencyCode];
}