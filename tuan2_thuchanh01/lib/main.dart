import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Container( 
          padding: EdgeInsets.all(6), 
          decoration: BoxDecoration(
            shape: BoxShape.circle, 
            border: Border.all(color: Colors.black, width: 2), // 
          ),
          child: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {},
          ),
        ),
        actions: [
          Container(  
            padding: EdgeInsets.all(6), 
            decoration: BoxDecoration(
              shape: BoxShape.circle, 
              border: Border.all(color: Colors.black, width: 2), 
            ),
            child: IconButton(
              icon: Icon(Icons.edit, color: Colors.black),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage('assets/anhAI.jpg'), // 
            ),
            SizedBox(height: 16),
            Text(
              'Johan Smith',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(
              'California, USA',
              style: TextStyle(fontSize: 25, color: Colors.grey),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
