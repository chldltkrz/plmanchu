import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plmanchu/info/memberController.dart';
// 인트로 페이지로의 이동을 위해 import 추가
import 'package:plmanchu/pages/intro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Membercontroller, 컨트롤러를 등록하기 위한 코드, 석제 방지를 위해 permanent를 true로 설정
    Get.put(Membercontroller(), permanent: true);
    // GetX를 사용하기 위해 GetMaterialApp을 사용하여 MaterialApp을 대체
    return GetMaterialApp(
      title: 'PlmanchuIntroducing',
      home: IntroPage(),
    );
  }
}
