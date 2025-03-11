import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // 🔴 Thêm import này để dùng TextInputFormatter

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Thuc Hanh 01',
      debugShowCheckedModeBanner: false,
      home: const ThucHanh01Screen(),
    );
  }
}

class ThucHanh01Screen extends StatefulWidget {
  const ThucHanh01Screen({super.key});

  @override
  State<ThucHanh01Screen> createState() => _ThucHanh01ScreenState();
}

class _ThucHanh01ScreenState extends State<ThucHanh01Screen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  String _result = '';

  void _checkAgeCategory() {
    final name = _nameController.text.trim();
    final ageText = _ageController.text.trim();
    final age = int.tryParse(ageText);

    if (name.isEmpty) {
      setState(() {
        _result = 'Vui lòng nhập họ và tên và nhập tuổi.';
      });
      return;
    }

    if (age == null) {
      setState(() {
        _result = 'Tuổi không hợp lệ. Vui lòng nhập số.';
      });
      return;
    }

    String category;
    if (age > 65) {
      category = 'Người già (>65)';
    } else if (age >= 6) {
      category = 'Người lớn (6-65)';
    } else if (age >= 2) {
      category = 'Trẻ em (2-6)';
    } else {
      category = 'Em bé (<2)';
    }

    setState(() {
      _result = 'Chào $name, bạn thuộc nhóm: $category';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Tạo khoảng cách từ cạnh trên
            const SizedBox(height: 80),

            // Chữ THỰC HÀNH 01 ở giữa
            const Text(
              'THỰC HÀNH 01',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            // Khoảng cách giữa tiêu đề và khung
            const SizedBox(height: 40),

            // Khung đen mờ chứa 2 TextField
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.05),
                border: Border.all(color: Colors.black54),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  // Nhập Họ và tên
                  TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: 'Họ và tên',
                      border: OutlineInputBorder(),
                    ),
                    // 🔴 SỬA CHỖ NÀY (CÁCH 3)
                    // Thêm TextInputFormatter cho phép nhập tiếng Việt có dấu
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp(r'^[a-zA-ZÀ-ỹ\s]+$'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Nhập Tuổi
                  TextField(
                    controller: _ageController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Tuổi',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),

            // Nút "Kiểm tra" nằm ngoài khung
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _checkAgeCategory,
              child: const Text('Kiểm tra'),
            ),

            // Hiển thị kết quả
            const SizedBox(height: 20),
            Text(
              _result,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),

            // Tạo thêm khoảng trống cuối
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
