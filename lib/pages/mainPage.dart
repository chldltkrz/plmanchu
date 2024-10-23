import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plmanchu/info/memberController.dart';
import 'package:plmanchu/pages/specA.dart';

class Mainpage extends StatelessWidget {
  const Mainpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(); // 뒤로 가기 기능
          },
        ),
        title: Text('메인 페이지'),
        centerTitle: true, // 제목을 중앙에 배치
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '오늘의 추천',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8), // 첫 번째와 두 번째 타이틀 사이 간격
            Text(
              '알고싶은 카드를 선택해보세요',
              style: TextStyle(
                fontSize: 24,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 40), // 두 번째 타이틀과 그리드 사이 간격
            Expanded(
              child: GridView.count(
                crossAxisCount: 2, // 한 줄에 2개의 사진
                crossAxisSpacing: 10, // 그리드 칸 사이 가로 간격
                mainAxisSpacing: 10, // 그리드 칸 사이 세로 간격
                children: [
                  ...List<Widget>.generate(
                      Get.find<Membercontroller>().getMemberLength(), (index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => specA(
                                    memberInfo: Get.find<Membercontroller>()
                                        .getMember(index),
                                  )),
                        );
                      },
                      child: Image.asset(
                          Get.find<Membercontroller>().getMember(index).image),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
