import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plmanchu/info/memberInfo.dart';
import 'package:plmanchu/pages/mainPage.dart';
import 'package:plmanchu/pages/specA_1.dart';

class specA extends StatelessWidget {
  MemberInfo memberInfo;
  int index;
  specA({super.key, required this.memberInfo, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Get.off(Mainpage()); // 뒤로 가기 기능
            },
          ),
          title: Text(memberInfo.name)),
      body: Column(
        mainAxisAlignment:
            MainAxisAlignment.start, // Align items from the start
        children: [
          // Placeholder for the image
          Container(
            margin:
                EdgeInsets.symmetric(vertical: 16.0), // Space around the image
            height: 200.0, // Adjust height as needed
            width: double.infinity, // Full width
            decoration: BoxDecoration(
              color: Colors.grey[300], // Placeholder color for the image
              borderRadius: BorderRadius.circular(8.0), // Rounded corners
            ),
            child:
                Center(child: Image.asset(memberInfo.image)), // Display image
          ),
          // Gray box with text
          Container(
            padding: EdgeInsets.all(16.0),
            margin: EdgeInsets.symmetric(horizontal: 16.0), // Space on sides
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Align text to the left
              children: [
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween, // Align name and MBTI
                  children: [
                    Expanded(
                      child: Text(
                        memberInfo.name, // Display member's name
                        style: TextStyle(
                            fontSize: 36, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(width: 8), // Space between name and MBTI
                    Text(
                      memberInfo.MBTI, // Display MBTI
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
                SizedBox(height: 8), // Space between rows
                Text(
                  memberInfo.introduce, // Display one line description
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
          Spacer(), // Pushes the button to the bottom
          Padding(
            padding: const EdgeInsets.only(
                bottom: 80.0), // Space from the bottom (adjustable)
            child: ElevatedButton(
              onPressed: () {
                // Navigate to detailed description page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          specA_1(memberInfo: memberInfo, index: index)),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                backgroundColor: Colors.black,
              ),
              child: Text(
                'More Details',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
