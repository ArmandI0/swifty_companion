import 'package:flutter/material.dart';
export 'AppBar.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {

  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        // On utilise Row dans le title
        children: [
          Expanded(
            // Le texte prend l'espace minimal nécessaire
            child: Text('Swifty Companion'),
          ),
        ],
      ),
      actions: [
        // Les boutons restent dans actions
        IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
      ],
    );
  }
  @override
  Size get preferredSize => Size.fromHeight(56.0);
}
