import 'package:flutter/material.dart';
import 'input_page.dart';
void main() {
  runApp(const Bmicalculator());
}

class Bmicalculator extends StatelessWidget {
  const Bmicalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        appBarTheme: AppBarTheme(color:Color(0xFF0A0E21),),
      ),
      home: InputPage(),
    );
  }
}




