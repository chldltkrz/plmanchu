import 'package:flutter/material.dart';
import 'package:plmanchu/pages/spec1.dart';
import 'package:plmanchu/pages/spec2.dart';
import 'package:plmanchu/pages/spec3.dart';
import 'package:plmanchu/pages/spec4.dart';

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
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => spec1()));
                      },
                      child: Image.asset('lib/assets/images/minu.png',
                          width: 150, height: 150, fit: BoxFit.fill)),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => spec2()));
                      },
                      child: Image.asset('lib/assets/images/yoonseo.png',
                          width: 150, height: 150, fit: BoxFit.fill))
                ]),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => spec3()));
                  },
                  child: Image.asset('lib/assets/images/sieun.png',
                      width: 150, height: 150, fit: BoxFit.fill)),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => spec4()));
                  },
                  child: Image.asset('lib/assets/images/isac.jpg',
                      width: 150, height: 150, fit: BoxFit.fill))
            ])
          ],
        ));
  }
}
