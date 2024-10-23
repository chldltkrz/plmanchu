// 맴버 정보를 담기 위한 클래스 
// 컨트롤러에서 상태를 관리하기 때문에 여기서 상태관리를 위한 Method는 필요 없음
class MemberInfo {
  String name; // 이름
  String MBTI; // MBTI
  String image; // 맴버사진
  List<String> hobbies; // 취미
  String major; // 전공
  List<String> careers; // 경력
  String targetApp; //  만들고자하는앱
  String introduce; // 자기소개
  String radarChart; // 레이더차트
  String blog; // 블로그
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
    required this.radarChart,
    required this.blog,
  });
}
