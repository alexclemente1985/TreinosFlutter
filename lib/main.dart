import 'package:flutter/material.dart';
// import 'package:flutter_intermediate/home.dart';
import 'package:flutter_intermediate/routes/app_routes.dart';
// import 'package:flutter_intermediate/sections/section_1/chips_keys_children.dart';
// import 'package:flutter_intermediate/sections/section_1/popup_menu_button.dart';
// import 'package:flutter_intermediate/sections/section_1/section1.dart';
// import 'package:flutter_intermediate/sections/section_1/sliders_indicators.dart';
// import 'package:flutter_intermediate/sections/section_1/tooltips.dart';
// import 'package:flutter_intermediate/sections/section_2/expansion_panel.dart';
// import 'package:flutter_intermediate/sections/section_2/gridview.dart';
// import 'package:flutter_intermediate/sections/section_2/section_2.dart';
// import 'package:flutter_intermediate/sections/section_2/stepper.dart';
// import 'package:flutter_intermediate/sections/section_2/tab_bar_view.dart';
// import 'package:flutter_intermediate/sections/section_3/animated_pie_chart.dart';
// import 'package:flutter_intermediate/sections/section_3/charts.dart';
// import 'package:flutter_intermediate/sections/section_3/grouping_data.dart';
// import 'package:flutter_intermediate/sections/section_3/section_3.dart';
// import 'package:flutter_intermediate/sections/section_4/child_to_parent.dart';
// import 'package:flutter_intermediate/sections/section_4/custom_widget.dart';
// import 'package:flutter_intermediate/sections/section_4/section_4.dart';
// import 'package:flutter_intermediate/sections/section_4/stateful_widget.dart';
// import 'package:flutter_intermediate/sections/section_4/widget_within.dart';
// import 'package:flutter_intermediate/sections/section_5/nav_from_child.dart';
// import 'package:flutter_intermediate/sections/section_5/push_named.dart';
// import 'package:flutter_intermediate/sections/section_5/push_named_until_and_remove.dart';
// import 'package:flutter_intermediate/sections/section_5/push_pop.dart';
// import 'package:flutter_intermediate/sections/section_5/section_5.dart';
// import 'package:flutter_intermediate/sections/section_6/global_state_screen.dart';
// import 'package:flutter_intermediate/sections/section_6/section_6.dart';

// Map<String, String> routePaths = {
//    "home": "/",
//     "section1": "/section1",
//     "tooltips": "/section1/tooltips",
//     "chips_keys_children": "/section1/chips_keys_children",
//     "sliders_indicators": "/section1/sliders_indicators",
//     "popup_menu_button":  "/section1/popup_menu_button",
//     "section2": "/section2",
//     "expansion_panel": "/section2/expansion_panel",
//     "tab_bar_view": "/section2/tab_bar_view",
//     "stepper": "/section2/stepper",
//     "gridview": "/section2/gridview",
//     "section3": "/section3",
//     "charts": "/section3/charts",
//     "grouping_data": "/section3/grouping_data",
//     "animated_pie_charts": "/section3/animated_pie_charts",
//     "section4": "/section4",
//     "custom_widget": "/section4/custom_widget",
//     "stateful_widget": "/section4/stateful_widget",
//     "widget_within": "/section4/widget_within",
//     "child_to_parent": "/section4/child_to_parent",
//     "section5": "/section5",
//     "push_named": "/section5/push_named",
//     "push_named_until_and_remove": "/section5/push_named_until_and_remove",
//     "push_and_pop": "/section5/push_and_pop",
//     "nav_from_child": "/section5/nav_from_child",
//     "section6": "/section6",
//     "global_state_screen": "/section6/global_state_screen",
//     "passing_variables": "/section6/passing_variables",
//     "redux": "/section6/redux",
//     "global_state_widget": "/section6/screens/global_state_widget",
//     "passing_variable_widget": "/section6/widgets/passing_variable_widget",
//     "redux_widget": "/section6/widgets/redux_widget",
// };

// Map<String, WidgetBuilder> routes = {
//     routePaths["home"]!: (BuildContext context) => Home(),
//     routePaths["section1"]!: (BuildContext context) => Section1(routes: routePaths),
//     routePaths["tooltips"]!: (BuildContext context) => Tooltips(),
//     routePaths["chips_keys_children"]!: (BuildContext context) => ChipsKeysChildren(),
//     routePaths["sliders_indicators"]!: (BuildContext context) => SlidersIndicators(),
//     routePaths["popup_menu_button"]!: (BuildContext context) => PopupMenuButtonWidget(),
//     routePaths["section2"]!: (BuildContext context) => Section2(routes: routePaths),
//     routePaths["expansion_panel"]!: (BuildContext context) => ExpansionPanelWidget(),
//     routePaths["tab_bar_view"]!: (BuildContext context) => TabBarViewWidget(),
//     routePaths["stepper"]!: (BuildContext context) => StepperWidget(),
//     routePaths["gridview"]!: (BuildContext context) => GridviewWidget(),
//     routePaths["section3"]!: (BuildContext context) => Section3(routes: routePaths),
//     routePaths["charts"]!: (BuildContext context) => Charts(),
//     routePaths["grouping_data"]!: (BuildContext context) => GroupingData(),
//     routePaths["animated_pie_charts"]!: (BuildContext context) => AnimatedPieChart(),
//     routePaths["section4"]!: (BuildContext context) => Section4(routes: routePaths),
//     routePaths["custom_widget"]!: (BuildContext context) => CustomWidget(),
//     routePaths["stateful_widget"]!: (BuildContext context) => StatefulWidgetComponent(),
//     routePaths["widget_within"]!: (BuildContext context) => WidgetWithin(),
//     routePaths["child_to_parent"]!: (BuildContext context) => ChildToParent(),
//     routePaths["section5"]!: (BuildContext context) => Section5(routes: routePaths),
//     routePaths["push_named"]!: (BuildContext context) => PushNamed(),
//     routePaths["push_named_until_and_remove"]!: (BuildContext context) => PushNamedUntilAndRemove(),
//     routePaths["push_and_pop"]!: (BuildContext context) => PushPop(),
//     routePaths["nav_from_child"]!: (BuildContext context) => NavFromChild(),
//     routePaths["section6"]!: (BuildContext context) => Section6(routes: routePaths),
//     routePaths["global_state_screen"]!: (BuildContext context) => GlobalStateScreen(),
//     routePaths["passing_variables"]!: (BuildContext context) => PushNamedUntilAndRemove(),
//     routePaths["redux"]!: (BuildContext context) => PushPop(),
//     routePaths["global_state_widget"]!: (BuildContext context) => PushPop(),
//     routePaths["passing_variable_widget"]!: (BuildContext context) => PushPop(),
//     routePaths["redux_widget"]!: (BuildContext context) => PushPop(),
// };

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    // home: Home(),
    routes: AppRoutes.routes,
    initialRoute: AppRoutes.routePaths['home'],
  ));
}


