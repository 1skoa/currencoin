part of 'crypto_coin_details_bloc.dart';

abstract class CryptoCoinDetailsState extends Equatable {}

class CryptoCoinDetailsInitial extends CryptoCoinDetailsState {
  @override
  List<Object> get props => [];
}

class CryptoCoinDetailsLoading extends CryptoCoinDetailsState {
  @override
  List<Object> get props => [];

}

class CryptoCoinDetailsLoaded extends CryptoCoinDetailsState {

     CryptoCoinDetailsLoaded({
    required this.coinDetails

  });
  final CryptoCoinDetails coinDetails;

  @override
  List<Object> get props => [coinDetails];
}

class CryptoCoinDetailsLoadingFailure extends CryptoCoinDetailsState {
   CryptoCoinDetailsLoadingFailure({
    required this.error
  });
  final String error;



  @override
  List<Object> get props => [error];
}
