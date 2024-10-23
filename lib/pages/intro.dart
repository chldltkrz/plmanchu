import 'package:flutter/material.dart';
import 'package:plmanchu/pages/mainPage.dart';

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              'PLMANCHU',
              style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              '"프로젝트에서 만남을 추구"',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 30), // 텍스트와 이미지 사이 간격
            Image.asset(
              'lib/assets/images/rtani.png', // assets 폴더에 있는 이미지 경로
              height: 200, // 이미지 높이 설정
              width: 200, // 이미지 너비 설정
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Mainpage()));
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                backgroundColor: Colors.blueGrey, // Background color of button
              ),
              child: Text(
                'START!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 80)
          ],
        ),
      ),
    );
  }
}
