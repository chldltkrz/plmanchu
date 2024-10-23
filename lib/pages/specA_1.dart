import 'package:flutter/material.dart';

class specA_1 extends StatelessWidget {
  const specA_1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gray box with 'My Keywords' and colored boxes
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'My Keywords',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildKeywordBox('MBTI', Colors.blue),
                      _buildKeywordBox('취미', Colors.red),
                      _buildKeywordBox('전공', Colors.yellow),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Two sections (경력 and 만들고자 하는 앱) will now divide the space
            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Start from the left
                children: [
                  _buildSection('경력', '아무거나'),
                  Divider(color: Colors.grey), // Thin gray line
                  _buildSection('만들고자 하는 앱', '아무거나'),
                ],
              ),
            ),
            SizedBox(height: 30), // Add space between sections and buttons
            // Buttons at the bottom
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Action for '좋아요' button
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    backgroundColor: Colors.blue,
                  ),
                  child: Text(
                    '좋아요',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Action for '블로그' button
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    backgroundColor: Colors.grey,
                  ),
                  child: Text(
                    '블로그',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 80), // Space between buttons and bottom
          ],
        ),
      ),
    );
  }

  // Helper method to build the keyword boxes
  Widget _buildKeywordBox(String text, Color color) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text(
        text,
        style: TextStyle(
            color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
      ),
    );
  }

  // Helper method to build sections with title and content
  Widget _buildSection(String title, String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align to the left
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20, // Same size as 'My Keywords'
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 4),
          Text(
            content,
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
