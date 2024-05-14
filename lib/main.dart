import 'package:flutter/material.dart';
import 'package:webflix/screens/home_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '오늘의 웹툰',
      home: HomeScreen(),
    );
  }
}
