import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plmanchu/info/memberController.dart';
import 'package:plmanchu/info/memberInfo.dart';
import 'package:plmanchu/pages/mainPage.dart';
import 'package:plmanchu/pages/radarChart.dart';
import 'package:plmanchu/pages/specA.dart';
// URL Launcher 를 사용하기 위해 flutter pub add url_launcher를 실행해주고 import를 추가해줘야한다
import 'package:url_launcher/url_launcher.dart';

class specA_1 extends StatelessWidget {
  // 인덱스를 받지 않으면 이후 여기서 changeLiked를 사용할 방법이 없음. 그래서 인덱스를 받아옴
  MemberInfo memberInfo;
  int index;

  specA_1({
    super.key,
    required this.memberInfo,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 역시 Appbar에서 바로 뒤로 페이지로 이동을 위한 Get.off로 변경
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.offAll(specA(
              memberInfo: memberInfo,
              index: index,
            )); // 뒤로 가기 기능
          },
        ),
        title: Text('Detail'),
      ),
      body: Padding(
        // 이전 specA 페이지에서 했던것 처럼 memberInfo를 받아와서 정보에 접근하여 사용함
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
                      // 여기서 햇갈릴수 있는데, 여기서 하는것은
                      // hobbies를 return할때 [취미,취미,...] 이런식으로 괄호가 붙어서 나오기 때문에 이것을 없애주기위해 substring을 사용함
                      // 첫번째 글자를 없애고 마지막 글자는 길이에서 -1을 해줌
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
                  Center(child: memberInfo.radarChartInfo),
                  Divider(color: Colors.grey), // Thin gray line
                  _buildSection(
                      '경력',
                      memberInfo.careers.toString().substring(
                          1, memberInfo.careers.toString().length - 1)),
                  Divider(color: Colors.grey), // Thin gray line
                  _buildSection('만들고자 하는 앱', memberInfo.targetApp),
                  Divider(color: Colors.grey),
                  // Thin gray line
                ],
              ),
            ),
            SizedBox(height: 30),
            // Add space between sections and buttons
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
