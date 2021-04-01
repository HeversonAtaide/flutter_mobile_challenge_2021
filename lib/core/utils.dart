import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

abstract class Utils {
  static Future<String> parseJsonFromAssets(String assetsPath) async {
    print('--- Parse json from: $assetsPath');
    return rootBundle.loadString(assetsPath).then((jsonStr) {
      return jsonStr;
    });
  }

  static String formatDate(DateTime dateTime) {
    DateTime threeHoursAgo = dateTime.subtract(new Duration(hours: 3));

    final DateFormat dateFormatDia = DateFormat('dd/MM/yyyy');
    final String dia = dateFormatDia.format(threeHoursAgo);
    return "$dia";
  }
}
