import 'package:flutter/material.dart';
import 'package:hyrule_app/screens/categories.dart';

void main() {
  runApp(const Hyrule());
}

class Hyrule extends StatelessWidget {
  const Hyrule({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hyrule',
      theme: ThemeData(
        //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        colorSchemeSeed: Colors.blue,
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      home: Categories(),
    );
  }
}


