
import 'dart:ui';

import 'package:amcmobile/themes/colors.dart';
import 'package:flutter/material.dart';


import 'app_colors.dart';

class AppTheme {
  static TextStyle cardTitleStyle()=>TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
    color: AppColors.cardTitleColor(),
  );

  static TextStyle dynamicTextStyle()=>TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
      letterSpacing: -1.3,
      color: AppColors.getDynamicTextColor()
  );

  static BoxDecoration boxDecorationStyle()=>BoxDecoration(
    color: AppColors.getContainerColor(),
    border: Border.all(color:AppColors.getBorderColor()),
    borderRadius: BorderRadius.circular(10),
  );


/*static final themeLight = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppColors.backgroundColorLight,
    appBarTheme: AppBarTheme(
      color: mytheme1_bordercolor
    )
  );

  static final themeDark = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppColors.backgroundColorDark,

  );

  static TextStyle mainTextStyle() => TextStyle(fontFamily: 'OpenSans',
    fontWeight: FontWeight.w400,
    color: AppColors.textColor(),
  );

  static TextStyle mainTextStyleBold() => mainTextStyle().copyWith(
    fontWeight: FontWeight.w700,
  );

  static TextStyle pageTitle() => mainTextStyleBold().copyWith(fontSize: 22.0);

  static TextStyle paragraph() => mainTextStyle().copyWith(fontSize: 14.0);

  static TextStyle body() => mainTextStyle().copyWith(
    fontSize: 16.0,
    fontFeatures: [FontFeature("tnum"), FontFeature('lnum')],
    height: 1,
  );

  static TextStyle bodyBold() => body().copyWith(
    fontWeight: FontWeight.w700,
  );
*/
}