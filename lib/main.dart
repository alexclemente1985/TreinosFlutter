import 'package:flutter/material.dart';
import 'package:flutter_intermediate/home.dart';
import 'package:flutter_intermediate/sections/section_1/chips_keys_children.dart';
import 'package:flutter_intermediate/sections/section_1/popup_menu_button.dart';
import 'package:flutter_intermediate/sections/section_1/section1.dart';
import 'package:flutter_intermediate/sections/section_1/sliders_indicators.dart';
import 'package:flutter_intermediate/sections/section_1/tooltips.dart';
import 'package:flutter_intermediate/sections/section_2/expansion_panel.dart';
import 'package:flutter_intermediate/sections/section_2/gridview.dart';
import 'package:flutter_intermediate/sections/section_2/section_2.dart';
import 'package:flutter_intermediate/sections/section_2/stepper.dart';
import 'package:flutter_intermediate/sections/section_2/tab_bar_view.dart';

Map<String, String> routePaths = {
   "home": "/",
    "section1": "/section1",
    "tooltips": "/section1/tooltips",
    "chips_keys_children": "/section1/chips_keys_children",
    "sliders_indicators": "/section1/sliders_indicators",
    "popup_menu_button":  "/section1/popup_menu_button",
    "section2": "/section2",
    "expansion_panel": "/section2/expansion_panel",
    "tab_bar_view": "/section2/tab_bar_view",
    "stepper": "/section2/stepper",
    "gridview": "/section2/gridview",
};

Map<String, WidgetBuilder> routes = {
    routePaths["home"]!: (BuildContext context) => Home(),
    routePaths["section1"]!: (BuildContext context) => Section1(routes: routePaths),
    routePaths["tooltips"]!: (BuildContext context) => Tooltips(),
    routePaths["chips_keys_children"]!: (BuildContext context) => ChipsKeysChildren(),
    routePaths["sliders_indicators"]!: (BuildContext context) => SlidersIndicators(),
    routePaths["popup_menu_button"]!: (BuildContext context) => PopupMenuButtonWidget(),
    routePaths["section2"]!: (BuildContext context) => Section2(routes: routePaths),
    routePaths["expansion_panel"]!: (BuildContext context) => ExpansionPanelWidget(),
    routePaths["tab_bar_view"]!: (BuildContext context) => TabBarViewWidget(),
    routePaths["stepper"]!: (BuildContext context) => StepperWidget(),
    routePaths["gridview"]!: (BuildContext context) => GridviewWidget(),

};

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    // home: Home(),
    routes: routes,
    initialRoute: routePaths["home"],
  ));
}


