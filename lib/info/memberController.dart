import 'package:get/get.dart';
import 'package:plmanchu/info/memberInfo.dart';
import 'package:plmanchu/pages/radarChart.dart';

// 컨트롤러를 상속받고 여기서 실제 맴버정보를 담은 클래스를 생성하게 된다
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
      blog: "https://matthewkang.tistory.com",
      radarChartInfo: const RadarChart(features: [
        "운",
        "코딩",
        "끈기",
        "창의성",
        "분석력",
        "실행력"
      ], data: [
        [50, 0, 50, 50, 50, 50]
      ], sides: 6),
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
        blog: "https://teem0.com",
        radarChartInfo: const RadarChart(features: [
          "운",
          "코딩",
          "끈기",
          "당근력",
          "분석력",
          "Linux"
        ], data: [
          [70, 60, 100, 100, 50, 70]
        ], sides: 6)),
    MemberInfo(
        name: "김시은",
        MBTI: "ENTJ",
        image: 'lib/assets/images/3.png',
        hobbies: ["헬스", "수영", "보드게임"],
        major: "전자공학과",
        careers: ["반도체 설계 엔지니어"],
        targetApp: "언어교환",
        introduce: "잘부탁드립니다",
        blog: "https://scene-inventory.tistory.com",
        radarChartInfo: const RadarChart(features: [
          "호기심",
          "코딩에 대한 열정",
          "끈기",
          "창의력",
          "의사소통 능력",
          "실행력"
        ], data: [
          [80, 100, 60, 70, 50, 60]
        ], sides: 6)),
    MemberInfo(
        name: "김윤서",
        image: 'lib/assets/images/4.png',
        MBTI: "EINFJ",
        hobbies: ["영화감상", "독서"],
        major: "디자인",
        careers: ["디자인", "운영관리"],
        targetApp: "Skrr",
        introduce: " 반갑습니다.\n 유익한 시간이 되면 좋겠습니다.\n 잘 부탁드립니다.",
        blog: "https://velog.io/@integralk",
        radarChartInfo: const RadarChart(features: [
          "기획력",
          "기존 코딩 경험",
          "끈기",
          "창의성",
          "경청&소통",
          "실행력"
        ], data: [
          [70, 0, 80, 60, 70, 70]
        ], sides: 6)),
  ];

  // 특정 인덱스의 맴버정보를 가져오는 method
  MemberInfo getMember(int index) {
    return members[index];
  }

  // 맴버의 명수를 return하는 method
  // 이 method는 mainPage.dart에서 사용됨
  // mainPage.dart에서는 GridView.count의 children을 생성할 때 사용
  int getMemberLength() {
    return members.length;
  }

  // 좋아요 여부를 return하는 method
  // 이 method는 mainPage.dart에서 좋아요 버튼을 사진 위에 띄울때 사용됨
  bool getLiked(int index) {
    return members[index].isLiked;
  }

  // 좋아요 버튼을 누를때 상태를 변화시키는 method
  // 좋아요 누른 다음에 구독자에게 알려주기 위해 update()를 호출
  void changeLike(index) {
    members[index].isLiked = !members[index].isLiked;
    update();
  }
}
