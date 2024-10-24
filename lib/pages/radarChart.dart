import 'dart:math' as math;
import 'package:flutter/material.dart';

const defaultGraphColors = [
  Colors.green,
  Colors.blue,
  Colors.red,
  Colors.orange,
];

class RadarChart extends StatefulWidget {
  // 레이더 차트 관련 설정을 위한 속성들
  final List<int> ticks; // 눈금 값들 (데이터의 범위를 정하는 역할)
  final List<String> features; // 레이더 차트의 각 축에 해당하는 라벨
  final List<List<num>> data; // 실제 데이터를 담고 있는 리스트
  final bool reverseAxis; // 축을 반대로 표시할지 여부
  final TextStyle ticksTextStyle; // 눈금 텍스트 스타일
  final TextStyle featuresTextStyle; // 축 라벨 텍스트 스타일
  final Color outlineColor; // 외곽선 색상
  final Color axisColor; // 축의 색상
  final List<Color> graphColors; // 그래프의 색상 리스트
  final int sides; // 다각형의 변 개수

  const RadarChart({
    super.key,
    this.ticks = const [20, 40, 60, 80, 90, 100], // 기본 눈금 값
    required this.features, // 필수로 받아야 하는 레이블들
    required this.data, // 필수로 받아야 하는 데이터들
    this.reverseAxis = false, // 반전 축 사용 여부 (사용하지 않음)
    this.ticksTextStyle = const TextStyle(color: Colors.red, fontSize: 12),
    this.featuresTextStyle = const TextStyle(color: Colors.blue, fontSize: 16),
    this.outlineColor = const Color.fromARGB(255, 50, 17, 17),
    this.axisColor = Colors.green, // 축 색상
    required this.sides, // 기본 다각형 변 개수
    this.graphColors = defaultGraphColors, // 기본 그래프 색상
  });

  @override
  _RadarChartState createState() => _RadarChartState();
}

class _RadarChartState extends State<RadarChart>
    with SingleTickerProviderStateMixin {
  // 애니메이션 관련 상태 관리
  double fraction = 0;
  late Animation<double> animation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    // 애니메이션 컨트롤러 생성, 1초 동안 애니메이션 진행
    animationController = AnimationController(
        duration: Duration(milliseconds: 1000), vsync: this);

    // 애니메이션 생성, 그래프가 부드럽게 나타나도록 설정
    animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      curve: Curves.fastOutSlowIn, // 부드러운 애니메이션 곡선
      parent: animationController,
    ))
      ..addListener(() {
        setState(() {
          // 애니메이션 진행 중 값을 업데이트
          fraction = animation.value;
        });
      });

    animationController.forward(); // 애니메이션 시작
  }

  @override
  void didUpdateWidget(RadarChart oldWidget) {
    super.didUpdateWidget(oldWidget);
    // 위젯 업데이트 시 애니메이션을 다시 실행
    animationController.reset();
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      // CustomPainter를 이용해 레이더 차트 그리기
      size: Size(180, 180), // 화면 전체 크기
      painter: RadarChartPainter(
        widget.ticks, // 눈금 값 전달
        widget.features, // 축 레이블 전달
        widget.data, // 데이터 전달
        widget.reverseAxis, // 축 반전 여부 (사용하지 않음)
        widget.ticksTextStyle, // 눈금 텍스트 스타일 전달
        widget.featuresTextStyle, // 축 레이블 텍스트 스타일 전달
        widget.outlineColor, // 외곽선 색상 전달
        widget.axisColor, // 축 색상 전달 (사용하지 않음)
        widget.graphColors, // 그래프 색상 전달
        widget.sides, // 다각형 변 개수 전달
        fraction, // 애니메이션 진행 값 전달
      ),
    );
  }

  @override
  void dispose() {
    // 애니메이션 컨트롤러 해제
    animationController.dispose();
    super.dispose();
  }
}

class RadarChartPainter extends CustomPainter {
  // 레이더 차트의 요소들을 정의하는 클래스
  final List<int> ticks; // 눈금 값 리스트
  final List<String> features; // 축 레이블
  final List<List<num>> data; // 데이터셋 리스트
  final bool reverseAxis; // 축 반전 여부 (사용하지 않음)
  final TextStyle ticksTextStyle; // 눈금 텍스트 스타일
  final TextStyle featuresTextStyle; // 축 레이블 텍스트 스타일
  final Color outlineColor; // 외곽선 색상
  final Color axisColor; // 축 색상 (사용하지 않음)
  final List<Color> graphColors; // 그래프 색상
  final int sides; // 다각형의 변 개수
  final double fraction; // 애니메이션 진행 비율

  RadarChartPainter(
    this.ticks,
    this.features,
    this.data,
    this.reverseAxis,
    this.ticksTextStyle,
    this.featuresTextStyle,
    this.outlineColor,
    this.axisColor,
    this.graphColors,
    this.sides,
    this.fraction,
  );

  @override
  void paint(Canvas canvas, Size size) {
    final Paint outlinePaint = Paint()
      ..color = outlineColor // 외곽선 색상
      ..strokeWidth = 2.0 // 외곽선 두께
      ..style = PaintingStyle.stroke; // 외곽선 그리기 모드

    final double radius = size.width / 2; // 차트의 반지름
    final Offset center = Offset(size.width / 2, size.height / 2); // 차트 중심

    // 외곽 다각형 그리기
    final Path path = Path();
    for (int i = 0; i < sides; i++) {
      double angle = (2 * math.pi * i) / sides; // 각도를 계산
      double x = center.dx + radius * fraction * math.cos(angle); // X 좌표
      double y = center.dy + radius * fraction * math.sin(angle); // Y 좌표
      if (i == 0) {
        path.moveTo(x, y); // 첫 번째 점으로 이동
      } else {
        path.lineTo(x, y); // 나머지 점들을 연결
      }
    }
    path.close(); // 마지막 점과 첫 번째 점 연결
    canvas.drawPath(path, outlinePaint); // 외곽선 그리기

    // // Ticks 그리기
    // for (int i = 0; i < ticks.length; i++) {
    //   double tickRadius = (radius / ticks.length) * (i + 1);
    //   Path tickPath = Path();
    //   for (int j = 0; j < sides; j++) {
    //     double angle = (2 * math.pi * j) / sides;
    //     double x = center.dx + tickRadius * math.cos(angle);
    //     double y = center.dy + tickRadius * math.sin(angle);
    //     if (j == 0) {
    //       tickPath.moveTo(x, y);
    //     } else {
    //       tickPath.lineTo(x, y);
    //     }
    //   }
    //   tickPath.close();
    //   canvas.drawPath(tickPath, outlinePaint);

    //   // 눈금 텍스트 표시
    //   final textPainter = TextPainter(
    //     text: TextSpan(text: '${ticks[i]}', style: ticksTextStyle),
    //     textDirection: TextDirection.ltr,
    //   );
    //   textPainter.layout();
    //   textPainter.paint(
    //     canvas,
    //     Offset(center.dx - textPainter.width - 5, center.dy - tickRadius),
    //   );
    // }

    // Features 텍스트 그리기
    for (int i = 0; i < features.length; i++) {
      double angle = (2 * math.pi * i) / sides;
      double x = center.dx + (radius + 20) * math.cos(angle); // 축 끝점
      double y = center.dy + (radius + 20) * math.sin(angle); // 축 끝점

      final textPainter = TextPainter(
        text: TextSpan(text: features[i], style: featuresTextStyle),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();

      // 축 끝점에 텍스트 그리기
      textPainter.paint(
        canvas,
        Offset(x - textPainter.width / 2, y - textPainter.height / 2),
      );
    }

    // 각 데이터 셋에 따른 레이더 차트 그리기
    for (int i = 0; i < data.length; i++) {
      final List<num> dataset = data[i];
      final Paint dataPaint = Paint()
        ..color =
            graphColors[i % graphColors.length].withOpacity(0.8) // 데이터셋 색상
        ..style = PaintingStyle.fill; // 내부를 채우는 스타일

      final Path dataPath = Path();
      for (int j = 0; j < sides; j++) {
        double angle = (2 * math.pi * j) / sides; // 각도 계산
        double value = dataset[j] / ticks.last; // 비율 계산 (데이터 값 / 최대 눈금 값)
        double x =
            center.dx + radius * value * fraction * math.cos(angle); // X 좌표
        double y =
            center.dy + radius * value * fraction * math.sin(angle); // Y 좌표
        if (j == 0) {
          dataPath.moveTo(x, y); // 첫 번째 데이터 점
        } else {
          dataPath.lineTo(x, y); // 다른 데이터 점들 연결
        }

        // 데이터 값을 텍스트로 표시
        // final dataTextPainter = TextPainter(
        //   text: TextSpan(
        //     text: '${dataset[j]}',
        //     style: TextStyle(color: Colors.black, fontSize: 12),
        //   ),
        //   textDirection: TextDirection.ltr,
        // );
        // dataTextPainter.layout();
        // dataTextPainter.paint(
        //   canvas,
        //   Offset(x - dataTextPainter.width / 2, y - dataTextPainter.height / 2),
        // );

        // if (j == 0) {
        //   dataPath.moveTo(x, y);
        // } else {
        //   dataPath.lineTo(x, y);
        // }
      }
      dataPath.close(); // 데이터 경로 닫기
      canvas.drawPath(dataPath, dataPaint); // 데이터 차트 그리기
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // 애니메이션이 진행될 때마다 다시 그려야 하므로 true
  }
}
