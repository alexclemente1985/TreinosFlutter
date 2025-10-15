import 'package:flutter/material.dart';
import 'package:flutter_intermediate/home.dart';
import 'package:flutter_intermediate/sections/section_1/chips_keys_children.dart';
import 'package:flutter_intermediate/sections/section_1/popup_menu_button.dart';
import 'package:flutter_intermediate/sections/section_1/section1.dart';
import 'package:flutter_intermediate/sections/section_1/sliders_indicators.dart';
import 'package:flutter_intermediate/sections/section_1/tooltips.dart';

Map<String, String> routePaths = {
   "home": "/",
    "section1": "/section1",
    "tooltips": "/section1/tooltips",
    "chips_keys_children": "/section1/chips_keys_children",
    "sliders_indicators": "/section1/sliders_indicators",
    "popup_menu_button":  "/section1/popup_menu_button",
};

Map<String, WidgetBuilder> routes = {
    routePaths["home"]!: (BuildContext context) => Home(),
    routePaths["section1"]!: (BuildContext context) => Section1(routes: routePaths,),
    routePaths["tooltips"]!: (BuildContext context) => Tooltips(),
    routePaths["chips_keys_children"]!: (BuildContext context) => ChipsKeysChildren(),
    routePaths["sliders_indicators"]!: (BuildContext context) => SlidersIndicators(),
    routePaths["popup_menu_button"]!: (BuildContext context) => PopupMenuButtonWidget(),
};

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    // home: Home(),
    routes: routes,
    initialRoute: routePaths["home"],
  ));
}


