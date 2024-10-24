import 'package:plmanchu/pages/radarChart.dart';

class MemberInfo {
  String name; // 이름
  String MBTI; // MBTI
  String image; // 맴버사진
  List<String> hobbies; // 취미
  String major; // 전공
  List<String> careers; // 경력
  String targetApp; //  만들고자하는앱
  String introduce; // 자기소개
  String blog; // 블로그
  RadarChart? radarChartInfo; // 레이더차트 정보
  bool isLiked = false; // 좋아요 여부

  MemberInfo({
    required this.name,
    required this.MBTI,
    required this.image,
    required this.hobbies,
    required this.major,
    required this.careers,
    required this.targetApp,
    required this.introduce,
    required this.blog,
    required this.radarChartInfo,
  });
}
