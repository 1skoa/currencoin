import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void showUpdateDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Требуется обновление'),
        content: const Text('Доступна новая версия приложения. Пожалуйста, обновите приложение.'),
        actions: <Widget>[
          TextButton(
            child: const Text('Обновить'),
            onPressed: () {
              _launchURL();
            },
          ),
        ],
      );
    },
  );
}
void _launchURL() async {
  const url = 'https://www.iskoa.ru/';
  Uri uri = Uri.parse(url);

  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw 'Could not launch $url';
  }
}