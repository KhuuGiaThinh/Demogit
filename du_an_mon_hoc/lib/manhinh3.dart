import 'package:flutter/material.dart';
import 'manhinh5.dart'; // Import màn hình 5
import 'manhinh4.dart';

class OnboardingScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Ba dấu chấm (Sáng ở vị trí thứ 2)
          Positioned(
            top: 40,
            left: 16,
            child: Row(
              children: [
                Icon(Icons.circle, size: 10, color: Colors.grey),
                SizedBox(width: 5),
                Icon(Icons.circle, size: 10, color: Colors.blue), // Sáng
                SizedBox(width: 5),
                Icon(Icons.circle, size: 10, color: Colors.grey),
              ],
            ),
          ),

          // Skip button
          Positioned(
            top: 40,
            right: 16,
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WelcomeScreen()),
                );
              },
              child: Text("Skip", style: TextStyle(fontSize: 16, color: Colors.blue)),
            ),
          ),

          // Nội dung chính
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/anh3.png',
                  width: 300,
                ),
                SizedBox(height: 20),
                Text(
                  "Increase Work Effectiveness",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Time management and the determination of more important tasks will give your job statistics better and always improve",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
          ),

          // Thanh chứa nút Back và Next
          Positioned(
            bottom: 20,
            left: 16,
            right: 16,
            child: Row(
              children: [
                // Nút Mũi Tên Quay Lại
                FloatingActionButton(
                  onPressed: () {
                    Navigator.pop(context); // Quay lại màn hình trước
                  },
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.arrow_back, color: Colors.white),
                ),
                SizedBox(width: 16),

                // Nút Next (Chuyển sang màn hình 3)
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => OnboardingScreen3()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text("Next", style: TextStyle(fontSize: 16, color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
