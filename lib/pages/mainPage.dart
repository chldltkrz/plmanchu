import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plmanchu/info/memberController.dart';
import 'package:plmanchu/info/memberInfo.dart';
import 'package:plmanchu/pages/intro.dart';
import 'package:plmanchu/pages/specA.dart';

class Mainpage extends StatelessWidget {
  const Mainpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 여기부터 각 Appbar는 뒤로가기가 활성화 되어 있음, 그리고 stacking을 방지하기 위해 Get.off로 변경
      // Get.off는 현재 페이지를 없애고 이동할 특정 페이지로 이동하는 기능
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // MainPage에서는 IntroPage로 이동
            Get.off(IntroPage()); // 뒤로 가기 기능
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
              "오늘의 카드",
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8), // 첫 번째와 두 번째 타이틀 사이 간격
            Text(
              '궁금한 카드를 클릭해보세요!',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 40), // 두 번째 타이틀과 그리드 사이 간격
            Expanded(
              child: GridView.count(
                crossAxisCount: 2, // 한 줄에 2개의 사진
                crossAxisSpacing: 10, // 그리드 칸 사이 가로 간격
                mainAxisSpacing: 10, // 그리드 칸 사이 세로 간격
                children: [
                  // ... 은 List<Widget>을 맴버별로 펼처서 입력을 넣어주는 역할
                  ...List<Widget>.generate(
                      // 총 맴버수를 반환하고, 그 인덱스를 받아서 각 맴버의 정보를 가져옴
                      Get.find<Membercontroller>().getMemberLength(), (index) {
                    // 맴버 정보를 가져오는 코드
                    MemberInfo mI =
                        Get.find<Membercontroller>().getMember(index);

                    // GestureDetector로 감싸서 클릭 이벤트를 추가
                    return GestureDetector(
                        onTap: () {
                          // 클릭시 specA 페이지로 이동
                          // 이동할 때 맴버 정보와 인덱스를 같이 넘겨줌 -> 추가 정보를 표시하기 위함
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => specA(
                                      memberInfo: mI,
                                      index: index,
                                    )),
                          );
                        },
                        // Stack으로 이미지와 좋아요 아이콘을 겹쳐서 표시
                        child: Stack(children: [
                          // 1차적으로 큰 틀에 Image를 표시하고
                          Image.asset(mI.image),
                          // Positioned로 좋아요 아이콘을 겹쳐서 표시
                          Positioned(
                              // 아래 옵션은 좋아요 아이콘을 이미지의 중앙에 표시하기 위한 옵션
                              bottom: 0,
                              top: 0,
                              left: 0,
                              right: 0,

                              // 여기서 GetBuilder를 사용하여 컨트롤러를 구독하고, 좋아요 여부에 따라 아이콘을 표시
                              // init와 builder를 설정해줘야 함.
                              // init에 현재 구독할 컨트롤러를 설정해주고
                              // builder에는 실제로 상태를 표시할 위젯을 설정해줌
                              child: GetBuilder(
                                init: Get.find<Membercontroller>(),
                                builder: (controller) =>
                                    // 여기서 Ternary Operator로 좋아요가 true일 경우 Opacity에 아이콘을 추가한 아이콘을 표시하고
                                    // false일 경우 빈 Container를 표시함
                                    controller.getLiked(index)
                                        ? Opacity(
                                            opacity: 0.3,
                                            child: const Icon(
                                              Icons.thumb_up,
                                              size: 80,
                                              color: Colors.blue,
                                            ),
                                          )
                                        : Container(),
                              ))
                        ]));
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
