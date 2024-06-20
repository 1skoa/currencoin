import 'package:crypto_coins_list/widgets/dialogs/update_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

Future<void> checkForUpdates(BuildContext context) async {
  try {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String currentVersion = packageInfo.version;
    print('Текущая версия приложения: $currentVersion');
    Dio dio = Dio();
    Response response = await dio.get('https://iskoa.ru/versions/cryptoin-v.git.txt');
    if (response.statusCode == 200) {
      String remoteVersion = response.data.toString().trim().replaceAll('|', '');

      if (_isNewerVersion(currentVersion, remoteVersion)) {
        showUpdateDialog(context);
      }
    }
  } catch (e) {
    print('Ошибка при проверке обновления: $e');
  }
}

bool _isNewerVersion(String currentVersion, String remoteVersion) {
  List<int> currentParts = currentVersion.split('.').map(int.parse).toList();
  List<int> remoteParts = remoteVersion.split('.').map(int.parse).toList();

  for (int i = 0; i < remoteParts.length; i++) {
    if (i >= currentParts.length || remoteParts[i] > currentParts[i]) {
      return true;
    } else if (remoteParts[i] < currentParts[i]) {
      return false;
    }
  }
  return false;
}
