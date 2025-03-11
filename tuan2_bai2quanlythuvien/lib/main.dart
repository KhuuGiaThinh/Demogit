import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart'; // Import thêm

void main() {
  runApp(const LibraryApp());
}

class LibraryApp extends StatelessWidget {
  const LibraryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LibraryScreen(),
    );
  }
}

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  final TextEditingController _userController = TextEditingController();
  final Map<String, List<Map<String, String>>> userBooks = {};
  final List<String> savedUsers = [];
  List<Map<String, String>> books = [];
  String? selectedUser;
  bool isUserSaved = false;

  void _saveUser() {
    final userName = _userController.text.trim();
    if (userName.isNotEmpty && !savedUsers.contains(userName)) {
      setState(() {
        savedUsers.add(userName);
        userBooks[userName] = <Map<String, String>>[];
        selectedUser = userName;
        isUserSaved = true;
      });
    }
  }

  void _showUserList() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView.builder(
          itemCount: savedUsers.isEmpty ? 1 : savedUsers.length,
          itemBuilder: (context, index) {
            if (savedUsers.isEmpty) {
              return const ListTile(title: Text("Không có tên nào được lưu"));
            }
            return ListTile(
              title: Text(savedUsers[index]),
              onTap: () {
                setState(() {
                  selectedUser = savedUsers[index];
                  _userController.text = savedUsers[index];
                  books = userBooks[selectedUser] ?? [];
                  isUserSaved = true;
                });
                Navigator.pop(context);
              },
            );
          },
        );
      },
    );
  }

  void _addBook() {
    if (!isUserSaved || selectedUser == null) return;
    showDialog(
      context: context,
      builder: (context) {
        final TextEditingController bookController = TextEditingController();
        final TextEditingController dateController = TextEditingController();

        return AlertDialog(
          title: const Text("Nhập thông tin sách"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: bookController,
                decoration: const InputDecoration(hintText: "Tên sách"),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: dateController,
                decoration: const InputDecoration(
                  hintText: "Ngày trả (dd/MM/yyyy)",
                ),
                keyboardType: TextInputType.datetime,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'\d|/')), // Sửa lỗi thiếu import
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Hủy"),
            ),
            TextButton(
              onPressed: () {
                if (bookController.text.trim().isNotEmpty &&
                    dateController.text.trim().isNotEmpty) {
                  final String borrowedDate =
                      DateFormat('dd/MM/yyyy').format(DateTime.now());
                  setState(() {
                    userBooks[selectedUser!]!.add({
                      'name': bookController.text.trim(),
                      'borrowedDate': borrowedDate,
                      'returnDate': dateController.text.trim(),
                    });
                    books = userBooks[selectedUser!]!;
                  });
                }
                Navigator.pop(context);
              },
              child: const Text("Thêm"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hệ thống Quản lý Thư viện'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Người dùng',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _userController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      setState(() {
                        if (userBooks.containsKey(value)) {
                          books = userBooks[value]!;
                          isUserSaved = true;
                        } else {
                          books = [];
                          isUserSaved = false;
                        }
                      });
                    },
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _showUserList,
                  child: const Text('Đổi'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _saveUser,
                  child: const Text('Lưu'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Danh sách sách',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.black.withAlpha(13), // Sửa lỗi withOpacity()
                border: Border.all(color: Colors.black54),
                borderRadius: BorderRadius.circular(8),
              ),
              child: books.isEmpty || selectedUser == null || !isUserSaved
                  ? const Center(child: Text("Chưa có sách nào"))
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: books.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: const Icon(Icons.book, color: Colors.red),
                          title: Text("${books[index]['name']}"),
                          subtitle: Text(
                              "${books[index]['borrowedDate']} - ${books[index]['returnDate']}"),
                        );
                      },
                    ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: _addBook,
                child: const Text('Thêm'),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Trang chủ"),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: "DS. Sách"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Nhân viên"),
        ],
      ),
    );
  }
}
