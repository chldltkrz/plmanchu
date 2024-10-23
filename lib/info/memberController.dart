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
        blog: "https://matthewkang.tistory.com"),
    MemberInfo(
        name: "최이삭",
        MBTI: "INTJ",
        image: 'lib/assets/images/2.png',
        hobbies: ["피아노", "드럼"],
        major: "컴공",
        careers: ["클라우드엔지니어", "k8s개발자"],
        targetApp: "당근마켓",
        introduce: "잘부탁드립니다",
        radarChart: 'lib/assets/images/radarChart.png',
        blog: "https://teem0.com"),
    MemberInfo(
        name: "김시은",
        MBTI: "ENTJ",
        image: 'lib/assets/images/3.png',
        hobbies: ["헬스", "수영", "보드게임"],
        major: "전자공학과",
        careers: ["반도체 설계 엔지니어"],
        targetApp: "언어교환",
        introduce: "잘부탁드립니다",
        radarChart: 'lib/assets/images/radarChart.png',
        blog: "https://scene-inventory.tistory.com"),
    MemberInfo(
        name: "김윤서",
        image: 'lib/assets/images/4.png',
        MBTI: "EINFJ",
        hobbies: ["영화감상", "독서"],
        major: "디자인",
        careers: ["디자인", "운영관리"],
        targetApp: "Skrr",
        introduce: "잘부탁드립니다",
        radarChart: 'lib/assets/images/radarChart.png',
        blog: "https://www.google.com"),
  ];

  MemberInfo getMember(int index) {
    return members[index];
  }

  int getMemberLength() {
    return members.length;
  }

  bool getLiked(int index) {
    return members[index].isLiked;
  }

  void changeLike(index) {
    members[index].isLiked = !members[index].isLiked;
    update();
  }
}
