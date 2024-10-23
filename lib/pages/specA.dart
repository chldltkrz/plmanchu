import 'package:flutter/material.dart';
import 'package:plmanchu/pages/specA_1.dart';

class specA extends StatelessWidget {
  const specA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About...'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '이름, MBTI, 한줄포부 등 간략한 설명',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // 더 상세한 설명 페이지로 이동
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => specA_1()),
              );
            },
            child: Text('좀 더 자세히 알고싶다면?'),
          ),
        ],
      ),
    );
  }
}
