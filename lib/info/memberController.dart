import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:plmanchu/info/memberInfo.dart';

class Membercontroller extends GetxController {
  List<MemberInfo> members = [
    MemberInfo(
      name: "강민우",
      MBTI: "ENFP",
      image: 'lib/assets/images/1.png',
      hobbies: ["헬스", "위스키"],
      major: "금융",
      careers: ["PM", "블록체인"],
      targetApp: "에어비앤비",
      introduce: "잘부탁드립니다",
      radarChart: 'lib/assets/images/radarChart.png',
    ),
    MemberInfo(
        name: "최이삭",
        MBTI: "INTJ",
        image: 'lib/assets/images/2.png',
        hobbies: ["피아노", "드럼"],
        major: "컴공",
        careers: ["클라우드엔지니어", "k8s개발자"],
        targetApp: "당근마켓",
        introduce: "잘부탁드립니다",
        radarChart: 'lib/assets/images/radarChart.png'),
    MemberInfo(
      name: "김윤서",
      image: 'lib/assets/images/3.png',
      MBTI: "EINFJ",
      hobbies: ["영화감상", "독서"],
      major: "디자인",
      careers: ["디자인", "운영관리"],
      targetApp: "Skrr",
      introduce: "잘부탁드립니다",
      radarChart: 'lib/assets/images/radarChart.png',
    ),
  ];

  MemberInfo getMember(int index) {
    return members[index];
  }

  int getMemberLength() {
    return members.length;
  }
}
