import 'package:flutter/material.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Center(
          child: Image.asset(
            'assets/images/logo.png',
            height: 32,
          ),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            // Handle notification tap
            print('Notification tapped');
          },
          icon: const Icon(
            Icons.notifications_outlined,
            color: Colors.black54,
            size: 24,
          ),
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}