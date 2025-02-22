import 'package:flutter/material.dart';
export 'AppBar.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading:
          Navigator.canPop(context)
              ? IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () => Navigator.of(context).pop(),
              )
              : null,
      title: Row(children: [Expanded(child: Text('Swifty Companion'))]),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.0);
}
