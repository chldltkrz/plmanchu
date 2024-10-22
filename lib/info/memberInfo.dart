import 'package:flutter/material.dart';

class Memberinfo {
  String name;
  String MBTI;
  Image image;
  List<String> hobbies;
  String major;
  List<String> careers;
  String targetApp;
  String introduce;
  Image pentagram;

  Memberinfo({
    required this.name,
    required this.MBTI,
    required this.image,
    required this.hobbies,
    required this.major,
    required this.careers,
    required this.targetApp,
    required this.introduce,
    required this.pentagram,
  });
}
