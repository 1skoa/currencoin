import 'package:flutter/material.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/models/crypto_coin_details.dart';

class CryptoCoinDetailsTile extends StatelessWidget {
  final CryptoCoinDetails coinDetails;

  const CryptoCoinDetailsTile({super.key, required this.coinDetails});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50.0), // Отступы сверху и снизу
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.network(
              coinDetails.imageUrl,
              width: 100,
              height: 100,
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(8.0),
              constraints: const BoxConstraints(
                minWidth: 100, // минимальная ширина
                maxWidth: 200, // максимальная ширина
              ),
              child: Center(
                child: Text(
                  coinDetails.name,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(10.0),
              constraints: const BoxConstraints(
                minWidth: 150, // минимальная ширина
                maxWidth: 250, // максимальная ширина
              ),
              decoration: BoxDecoration(
                color: isDarkMode ? Colors.green.shade900 : Colors.green.shade50,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Center(
                child: Text(
                  '${coinDetails.priceInUSD.toStringAsFixed(10)} \$',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(10.0),
              constraints: const BoxConstraints(
                minWidth: 250,
                maxWidth: 350,
              ),
              // decoration: BoxDecoration(
              //   color: isDarkMode ? Colors.black54 : Colors.green.shade50,
              //   borderRadius: BorderRadius.circular(10.0),
              // ),
              child: Column(
                children: [
                  Text(
                    'Макс. за сутки - ${coinDetails.high24Hour.toStringAsFixed(12)} \$',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: Colors.lightGreen,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Мин. за сутки - ${coinDetails.low24Hour.toStringAsFixed(12)} \$',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: Colors.redAccent,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
