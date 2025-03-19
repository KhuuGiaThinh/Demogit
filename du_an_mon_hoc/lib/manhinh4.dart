import 'package:flutter/material.dart';
import 'manhinh5.dart';

class OnboardingScreen3 extends StatelessWidget {
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Ba dấu chấm (Sáng ở vị trí thứ 3)
          Positioned(
            top: 40,
            left: 16,
            child: Row(
              children: [
                Icon(Icons.circle, size: 10, color: Colors.grey),
                SizedBox(width: 5),
                Icon(Icons.circle, size: 10, color: Colors.grey),
                SizedBox(width: 5),
                Icon(Icons.circle, size: 10, color: Colors.blue), // Sáng
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
                  'assets/images/anh4.png',
                  width: 300,
                ),
                SizedBox(height: 20),
                Text(
                  "Reminder Notification",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "The advantage of this application is that it also provides reminders for you so you don’t forget to keep doing your assignments well and according to the time you have set",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
          ),

          // Thanh chứa nút Back và Get Started
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

                // Nút Get Started (Chuyển sang màn hình Welcome)
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => WelcomeScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text("Get Started", style: TextStyle(fontSize: 16, color: Colors.white)),
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
