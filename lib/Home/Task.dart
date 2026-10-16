import 'package:flutter/material.dart';
import 'package:do_an_flutter/MainLayout.dart';

class InboxPage extends StatelessWidget {
  const InboxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainLayout(
      title: 'Task',
      body: Center(
        child: Text(
          'Nội dung trang Task ở đây',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
