import 'package:flutter/material.dart';
import 'package:mda_atelier_flutter/home_page.dart';

void main() {
  runApp(MdaAtelierApp());
}

class MdaAtelierApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.orange, accentColor: Colors.green, primaryColor: Colors.orange),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
