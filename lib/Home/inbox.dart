import 'package:flutter/material.dart';
import 'package:do_an_flutter/MainLayout.dart';

class InboxPage extends StatelessWidget {
  const InboxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainLayout(
      title: 'Inbox',
      body: Center(
        child: Text(
          'Nội dung trang Inbox ở đây',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
