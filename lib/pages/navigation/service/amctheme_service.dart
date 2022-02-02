import 'package:amcmobile/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:tinycolor/tinycolor.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AmcThemeService extends GetxService{
  final _storage=GetStorage("permananent-db");
  final _key = 'isDarkMode';

  var selectedThemeIndex=0.obs;

  @override
  void onInit() {
    selectedThemeIndex.value=_storage.read("themeIndex") ?? 0;
  }

  getThemeMode(){
    int index = _storage.read("themeIndex") ?? 0;
    return index==7 ? ThemeMode.dark : ThemeMode.light;
  }
  loadLightTheme() {
    int index = _storage.read("themeIndex") ?? 0;
    return ThemeData.light().copyWith(
      iconTheme: IconThemeData(color: AppColors.themes[index]),
      appBarTheme: AppBarTheme(color: AppColors.themes[index],elevation: 0,),
      scaffoldBackgroundColor: AppColors.themes[index].lighten(25),
      cardColor: AppColors.themes[index].lighten(49),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: AppColors.themes[index]
      ),
    );
  }

  loadDarkTheme(){
    int index=7;
    return ThemeData.dark().copyWith(
        iconTheme: IconThemeData(color: Colors.white),
        appBarTheme: AppBarTheme(color: Color(0xff303134),elevation: 0,),
        scaffoldBackgroundColor: AppColors.themes[index].lighten(25),
        cardColor: Color(0xff202124),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(selectedItemColor: Color(0xff8ab4f8)
        )
    );
  }

  onSelectTheme(int index){
    selectedThemeIndex.value=index;
    _storage.write("themeIndex", index);

    Get.changeTheme(index==7 ? loadDarkTheme() : loadLightTheme());
    Get.changeThemeMode(getThemeMode());
  }


  /// Load isDArkMode from local storage and if it's empty, returns false (that means default theme is light)
  /*bool _loadThemeFromStorage() => _storage.read(_key) ?? false;

  /// Save isDarkMode to local storage
  _saveThemeToBox(bool isDarkMode) => _storage.write(_key, isDarkMode);


  /// Get isDarkMode info from local storage and return ThemeMode
  ThemeMode get themeMode => _loadThemeFromStorage() ? ThemeMode.dark : ThemeMode.light;

  /// Switch theme and save to local storage
  void switchTheme() {
    Get.changeThemeMode(_loadThemeFromStorage() ? ThemeMode.light : ThemeMode.dark);
    _saveThemeToBox(!_loadThemeFromStorage());
  }*/
}