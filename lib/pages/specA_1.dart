import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plmanchu/info/memberController.dart';
import 'package:plmanchu/info/memberInfo.dart';
import 'package:plmanchu/pages/mainPage.dart';
import 'package:plmanchu/pages/specA.dart';
import 'package:plmanchu/pages/radarChart.dart'; // RadarChart 임포트
import 'package:plmanchu/info/radarController.dart';
import 'package:url_launcher/url_launcher.dart';

class specA_1 extends StatelessWidget {
  MemberInfo memberInfo;
  RadarChart? radarChart;
  int index;
  Radarcontroller radarController;

  specA_1(
      {super.key,
      required this.memberInfo,
      required this.index,
      this.radarChart,
      required this.radarController});

  @override
  Widget build(BuildContext context) {
    // RadarController에서 특정 인덱스의 데이터 가져오기
    final radarController = Get.find<Radarcontroller>();

    // radarChart 초기화 (해당 인덱스의 RadarChart 할당)
    radarChart ??= radarController.radar[index];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.off(specA(
              memberInfo: memberInfo,
              index: index,
              radarController: radarController,
            )); // 뒤로 가기 기능
          },
        ),
        title: Text('Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gray box with 'My Keywords' and colored boxes
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(238, 238, 238, 1),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'My Keywords',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildKeywordBox(memberInfo.MBTI, Colors.blue),
                      _buildKeywordBox(
                          memberInfo.hobbies.toString().substring(
                              1, memberInfo.hobbies.toString().length - 1),
                          Colors.red),
                      _buildKeywordBox(memberInfo.major, Colors.yellow),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // RadarChart 렌더링
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSection('나만의 육각형', ''),
                  // RadarChart를 해당 인덱스에 맞게 렌더링
                  radarChart ?? SizedBox.shrink(),
                  Divider(color: Colors.grey), // Thin gray line
                  _buildSection(
                      '경력',
                      memberInfo.careers.toString().substring(
                          1, memberInfo.careers.toString().length - 1)),
                  Divider(color: Colors.grey), // Thin gray line
                  _buildSection('만들고자 하는 앱', memberInfo.targetApp),
                ],
              ),
            ),
            SizedBox(height: 30), // Add space between sections and buttons
            // Buttons at the bottom
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.find<Membercontroller>().changeLike(index);
                    // get to main page
                    Get.to(() => Mainpage());
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    backgroundColor: Colors.blue,
                  ),
                  child: Text(
                    '좋아요',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final url = Uri.parse(memberInfo.blog);
                    await launchUrl(url);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    backgroundColor: Colors.grey,
                  ),
                  child: Text(
                    '블로그',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 80), // Space between buttons and bottom
          ],
        ),
      ),
    );
  }

  // Helper method to build the keyword boxes
  Widget _buildKeywordBox(String text, Color color) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text(
        text,
        style: TextStyle(
            color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
      ),
    );
  }

  // Helper method to build sections with title and content
  Widget _buildSection(String title, String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align to the left
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20, // Same size as 'My Keywords'
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 4),
          Text(
            content,
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
