import 'package:flutter/material.dart';
import 'manhinh5.dart'; // Import màn hình 5
import 'manhinh3.dart'; // Import màn hình tiếp theo

class OnboardingScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Ba dấu chấm
          Positioned(
            top: 40,
            left: 16,
            child: Row(
              children: [
                Icon(Icons.circle, size: 10, color: Colors.blue), // Sáng
                SizedBox(width: 5),
                Icon(Icons.circle, size: 10, color: Colors.grey),
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
                  'assets/images/anh2.png',
                  width: 300,
                ),
                SizedBox(height: 20),
                Text(
                  "Easy Time Management",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "With management based on priority and daily tasks, it will give you convenience in managing and determining the tasks that must be done first",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
          ),

          // Nút Next
          Positioned(
            bottom: 20,
            left: 16,
            right: 16,
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OnboardingScreen2()),
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
          ),
        ],
      ),
    );
  }
}
