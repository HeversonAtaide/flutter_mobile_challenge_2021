import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ScreenUtils {
  factory ScreenUtils() {
    return _instance ??= ScreenUtils._();
  }
  ScreenUtils._();

  static ScreenUtils _instance;
  static MediaQueryData mediaQueryData;

  static double safeAreaHorizontal;
  static double safeAreaVertical;

  static double screenWidth;
  static double screenHeight;
  static double blockSizeHorizontal;
  static double blockSizeVertical;

  static double safeScreenWidth;
  static double safeScreenHeight;
  static double safeBlockHorizontal;
  static double safeBlockVertical;

  static double pixelRatio;
  static double statusBarHeight;
  static double toolBarHeight = kToolbarHeight;
  static double bottomBarHeight = kBottomNavigationBarHeight;
  static double textScaleFactor;

  static double pageViewHeight;

  Future<void> init(BuildContext context) async {
    mediaQueryData = MediaQuery.of(context);

    safeAreaHorizontal =
        mediaQueryData.padding.left + mediaQueryData.padding.right;
    safeAreaVertical =
        mediaQueryData.padding.top + mediaQueryData.padding.bottom;

    screenWidth = mediaQueryData.orientation == Orientation.portrait
        ? mediaQueryData.size.width
        : mediaQueryData.size.height;
    screenHeight = mediaQueryData.orientation == Orientation.portrait
        ? mediaQueryData.size.height
        : mediaQueryData.size.width;

    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    safeBlockHorizontal = (screenWidth - safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - safeAreaVertical) / 100;

    pixelRatio = mediaQueryData.devicePixelRatio;
    statusBarHeight = mediaQueryData.padding.top;
    // bottomBarHeight = mediaQueryData.padding.bottom;
    textScaleFactor = mediaQueryData.textScaleFactor;

    screenWidth = mediaQueryData.size.width;
    screenHeight = mediaQueryData.size.height;

    safeScreenWidth = screenWidth - safeAreaHorizontal;
    safeScreenHeight = screenHeight - safeAreaVertical;

    pageViewHeight =
        screenHeight - statusBarHeight - bottomBarHeight - toolBarHeight;
  }
}
