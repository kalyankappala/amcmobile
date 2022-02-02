import 'package:flutter/material.dart';

var textColorPrimary = materialColor(0XFF212121);
const textColorSecondary = Color(0XFF747474);
const edit_text_background = Color(0XFFE8E8E8);
const white = Color(0XFFffffff);
//const colorPrimary = Color(0XFF5959fc);
const colorPrimary = Colors.blueAccent;
const view_color = Color(0XFFDADADA);

const mytheme1_bgcolor=Color(0xffF1F4FF);
const mytheme1_bordercolor=Color(0xFF82B1FF);
const mytheme2_color=Color(0xffe4d6f8);
const mytheme3_color=Color(0xffddebc9);
const mytheme4_color=Color(0xffF0D9FF);
const mytheme5_color=Color(0xffF6F6F6);

const mytheme1_textcolor=Color(0xff000000);
const circular_colors=[Colors.blue,Colors.red,Colors.orangeAccent,Colors.purple,Colors.lightGreen,Colors.purpleAccent,Colors.yellow,Colors.lightGreenAccent,Colors.lightGreen,Colors.purpleAccent,Colors.red,Colors.amberAccent,Colors.deepPurpleAccent,Colors.black38];

Map<int, Color> color = {
  50: Color.fromRGBO(136, 14, 79, .1),
  100: Color.fromRGBO(136, 14, 79, .2),
  200: Color.fromRGBO(136, 14, 79, .3),
  300: Color.fromRGBO(136, 14, 79, .4),
  400: Color.fromRGBO(136, 14, 79, .5),
  500: Color.fromRGBO(136, 14, 79, .6),
  600: Color.fromRGBO(136, 14, 79, .7),
  700: Color.fromRGBO(136, 14, 79, .8),
  800: Color.fromRGBO(136, 14, 79, .9),
  900: Color.fromRGBO(136, 14, 79, 1),
};

MaterialColor materialColor(colorHax) {
  return MaterialColor(colorHax, color);
}
