import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const WordGalaxy());
}

class WordGalaxy extends StatelessWidget {
  const WordGalaxy({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WordGalaxy',
      theme: ThemeData(
  brightness: Brightness.dark,

  scaffoldBackgroundColor: Color(0xff090114),

  appBarTheme: AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
  ),

  colorScheme: ColorScheme.dark(
    primary: Colors.purpleAccent,
  ),
),
      home: HomeScreen(),
    );
  }
}