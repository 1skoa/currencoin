import 'package:equatable/equatable.dart';

class CryptoCoinDetails extends Equatable {
  const CryptoCoinDetails({
    required this.name,
    // required this.toSymbol,
    required this.high24Hour,
    required this.low24Hour,
    required this.imageUrl,
    // required this.lastUpdate,
    required this.priceInUSD,
  });
  final String name;
  // final double toSymbol;
  final double high24Hour;
  final double low24Hour;
  final String imageUrl;
  // final DateTime lastUpdate;
  final double priceInUSD;


  @override
  List<Object?> get props => [
    name,
    // toSymbol,
    imageUrl,
    priceInUSD,
    // lastUpdate,
    high24Hour,
    low24Hour
  ];
}
