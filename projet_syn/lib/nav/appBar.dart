import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      surfaceTintColor: Colors.transparent,

      // نضبط ارتفاع الـ AppBar
      toolbarHeight: 80.0,

      // نضبط عرض المساحة المخصصة للـ leading
      leadingWidth: 72.0,

      leading: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Center(
          child: Image.asset(
            'assets/images/logo.png',
            width: 60,
            height: 60,
            fit: BoxFit.contain,
            errorBuilder: (ctx, err, stack) => const Icon(
              Icons.broken_image,
              size: 60,
              color: Colors.redAccent,
            ),
          ),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () => debugPrint('Notification tapped'),
          icon: const Icon(
            Icons.notifications_outlined,
            color: Colors.black54,
            size: 30,
          ),
          tooltip: 'Notifications',
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  // هذه الخاصية تحتاجها لأننا نغيّر ارتفاع الـ AppBar
  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}
