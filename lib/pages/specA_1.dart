import 'package:flutter/material.dart';

class specA_1 extends StatelessWidget {
  const specA_1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      body: Center(
        child: Text(
          '상세한 설명.\n이상앱 MBTI 포부 등등',
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}