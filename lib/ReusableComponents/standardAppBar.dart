// lib/ReusableComponents/standardAppBar.dart
import 'package:flutter/material.dart';

class StandardAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String titleText;
  final VoidCallback onIconPressed;

  StandardAppBar({
    super.key,
    required this.titleText,
    required this.onIconPressed,
  });

  @override
  Size get preferredSize => Size.fromHeight(56.0);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      title: Row(
        children: [
          SizedBox(
            width: screenWidth * 0.08,
          ),
          Text(
            titleText,
            style: const TextStyle(
              fontFamily: 'Ubuntu',
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          Spacer(),
          IconButton(
            onPressed: onIconPressed,
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
    );
  }
}
