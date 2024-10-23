import 'package:flutter/material.dart';
import 'package:plmanchu/pages/spec1.dart';
import 'package:plmanchu/pages/spec2.dart';
import 'package:plmanchu/pages/spec3.dart';
import 'package:plmanchu/pages/spec4.dart';
import 'package:plmanchu/pages/elevate_button.dart';

class Mainpage extends StatelessWidget {
  const Mainpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const Text(
              '오늘의 추천',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  elevateButton(
                      context, spec1(), 'lib/assets/images/minu.png', 150, 150),
                  elevateButton(
                      context, spec2(), 'lib/assets/images/sieun.png', 150, 150)
                ]),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              elevateButton(
                  context, spec3(), 'lib/assets/images/isac.jpg', 150, 150),
              elevateButton(
                  context, spec4(), 'lib/assets/images/yoonseo.png', 150, 150)
            ])
          ],
        ));
  }
}
