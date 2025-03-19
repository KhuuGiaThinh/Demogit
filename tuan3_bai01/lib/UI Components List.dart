import 'package:flutter/material.dart';
import 'text_detail_screen.dart'; // Import màn hình chi tiết

class UIComponentsListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UI Components List"),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          SectionTitle(title: "Display"),
          UIComponentTile(title: "Text", description: "Displays text", onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TextDetailScreen()),
            );
          }),
          UIComponentTile(title: "Image", description: "Displays an image", onTap: () {
            // TODO: Chuyển đến màn hình Image Detail
          }),

          SectionTitle(title: "Input"),
          UIComponentTile(title: "TextField", description: "Input field for text", onTap: () {}),
          UIComponentTile(title: "PasswordField", description: "Input field for passwords", onTap: () {}),

          SectionTitle(title: "Layout"),
          UIComponentTile(title: "Column", description: "Arranges elements vertically", onTap: () {}),
          UIComponentTile(title: "Row", description: "Arranges elements horizontally", onTap: () {}),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 8),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class UIComponentTile extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onTap;

  const UIComponentTile({required this.title, required this.description, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.blue[100],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(description, style: TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
