import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:listins/_core/listin_routes.dart';
import 'package:listins/_core/listin_theme.dart';
import 'package:listins/products/model/product.dart';
import 'package:path_provider/path_provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //final dir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter();
  Hive.registerAdapter(ProductAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Listin',
      debugShowCheckedModeBanner: false,
      theme: ListinTheme.mainTheme,
      initialRoute: ListinRoutes.auth,
      onGenerateRoute: ListinRoutes.generateRoute,
    );
  }
}
