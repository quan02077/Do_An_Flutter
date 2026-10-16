import 'package:flutter/material.dart';

class MainLayout extends StatelessWidget {
  final String title;
  final Widget body;
  final List<Widget>? customActions;

  const MainLayout({
    super.key,
    required this.title,
    required this.body,
    this.customActions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: Text(
          title,
          style: const TextStyle(
            fontFamily: 'MyCustomFont',
            fontWeight: FontWeight.bold,
            fontSize: 50,
          ),
        ),
        actions: customActions ?? [
          Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFF262626),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.edit_outlined, color: Colors.white, size: 24),
                  padding: const EdgeInsets.all(10),
                  constraints: const BoxConstraints(),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_horiz, color: Colors.white, size: 24),
                  padding: const EdgeInsets.all(10),
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
          ),
        ],
      ),
      body: body,
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20, left: 16, right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Thanh viên thuốc bên trái
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E1E1E),
                  borderRadius: BorderRadius.circular(35),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Icon Inbox (có chấm xanh)
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFF333333),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          const Icon(Icons.inbox_outlined, color: Colors.white, size: 26),
                          Positioned(
                            top: -2,
                            right: -2,
                            child: Container(
                              width: 10,
                              height: 10,
                              decoration: const BoxDecoration(
                                color: Color(0xFF3B82F6),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.center_focus_weak, color: Colors.white, size: 26),
                      padding: const EdgeInsets.all(12),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.auto_awesome, color: Colors.white, size: 24),
                      padding: const EdgeInsets.all(12),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.unfold_more, color: Colors.white, size: 26),
                      padding: const EdgeInsets.all(12),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 14),

              // Nút tròn bên phải
              Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Color(0xFF1E1E1E),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.open_in_new, color: Colors.white, size: 26),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
