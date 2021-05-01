import 'package:flutter/material.dart';
import 'package:reto_navbottombar/src/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RetoPage',
      home: HomePage(),
    );
  }
}
