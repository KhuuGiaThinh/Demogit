import 'package:flutter/material.dart';

class TextDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text Detail"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                style: TextStyle(fontSize: 24, color: Colors.black),
                children: [
                  TextSpan(text: "The "),
                  TextSpan(
                      text: "quick",
                      style: TextStyle(
                          decoration: TextDecoration.lineThrough)),
                  TextSpan(text: "  "),
                  TextSpan(
                      text: "Brown",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.brown)),
                  TextSpan(text: "\nfox j u m p s  "),
                  TextSpan(
                      text: "over",
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold)),
                  TextSpan(text: "\nthe "),
                  TextSpan(
                      text: "lazy",
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w300)),
                  TextSpan(text: " dog."),
                ],
              ),
            ),
            SizedBox(height: 16),
            Divider(),
          ],
        ),
      ),
    );
  }
}
