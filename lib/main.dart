import 'package:flutter/material.dart';
import 'package:flutter_fire_shopping_list/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping List',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          snackBarTheme:
              const SnackBarThemeData(backgroundColor: Colors.deepPurple)),
      home: const HomePage(),
    );
  }
}
