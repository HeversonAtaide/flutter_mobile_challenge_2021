import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

abstract class Utils {
  static Future<String> parseJsonFromAssets(String assetsPath) async {
    print('--- Parse json from: $assetsPath');
    return rootBundle.loadString(assetsPath).then((jsonStr) {
      return jsonStr;
    });
  }

  String formatDate(DateTime dateTime) {
    DateTime threeHoursAgo = dateTime.subtract(new Duration(hours: 3));

    final DateFormat dateFormatDia = DateFormat('dd/MM/yyyy');
    final DateFormat dateFormatHora = DateFormat('HH:mm');
    final String dia = dateFormatDia.format(threeHoursAgo);
    final String hora = dateFormatHora.format(threeHoursAgo);
    return "$dia às $hora";
  }
}
