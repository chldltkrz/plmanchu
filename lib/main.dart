import 'package:flutter/material.dart';
import 'package:plmanchu/pages/intro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PlmanchuIntroducing',
      // theme 은 설정 안해주나요?
      home: IntroPage(),
    );
  }
}
