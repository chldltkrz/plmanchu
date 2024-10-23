import 'package:get/get.dart';
import 'package:plmanchu/pages/radarChart.dart';

class Radarcontroller extends GetxController {
  List<RadarChart> radar = [
    const RadarChart(features: [
      "운",
      "코딩",
      "끈기",
      "창의성",
      "분석력",
      "실행력"
    ], data: [
      [10, 30, 50, 70, 90, 100]
    ], sides: 6),
    const RadarChart(features: [
      "AA",
      "BB",
      "CC",
      "DD",
      "EE"
    ], data: [
      [10, 30, 20, 40, 50, 80]
    ], sides: 6),
    const RadarChart(features: [
      "AA",
      "BB",
      "CC",
      "DD",
      "EE"
    ], data: [
      [10, 20, 20, 30, 50, 40]
    ], sides: 6),
    const RadarChart(features: [
      "AA",
      "BB",
      "CC",
      "DD",
      "EE"
    ], data: [
      [10, 10, 10, 10, 10, 10]
    ], sides: 6)
  ];
}
