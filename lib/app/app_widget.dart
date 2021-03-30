import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../core/screen_utils.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: Modular.navigatorKey,
      title: 'Pharma Inc',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
      builder: (context, child) {
        ScreenUtils().init(context);
        return Theme(
          data: ThemeData(),
          child: child,
        );
      },
    );
  }
}
