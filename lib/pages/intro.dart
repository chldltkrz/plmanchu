import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('플 만 추'),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 50,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                // Add your onPressed code here!
              },
              child: Text('시작하기'),
            ),
            SizedBox(height: 30), // Add some space at the bottom
          ],
        ),
      ),
    );
  }
}
