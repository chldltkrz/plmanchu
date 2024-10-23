import 'package:flutter/material.dart';

Widget elevateButton(BuildContext context, Widget page, String imagePath, int width, int height) {
  return ElevatedButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => page, // 함수 형태로 page() 호출
        ),
      );
    },
    child: Image.asset(imagePath, width: width.toDouble(), height: height.toDouble(), fit: BoxFit.fill),
  );
}
