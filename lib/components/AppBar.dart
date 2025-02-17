import 'package:flutter/material.dart';
export 'AppBar.dart';
import '../tools/Requests.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Models/User.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final Function(User) profileResult;

  const MyAppBar({super.key, required this.title, required this.profileResult});

  @override
  State<MyAppBar> createState() => _MyAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _MyAppBarState extends State<MyAppBar> {
  final _searchController = TextEditingController();

  void SearchOnApi42() async {
    final tokenManage = TokenManager();
    String? token = await tokenManage.getToken();
    String? nickname = _searchController.text;
    final url =
        "https://api.intra.42.fr/v2/users/$nickname"; // Changed URL to get single user

    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      try {
        final decodedData = User.fromJson(data);
        widget.profileResult(decodedData);
      } catch (e) {
        print("Error decoding user data: $e");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: Invalid user data format')),
        );
      }
    } else {
      print("ERROR: ${response.statusCode}");
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('User not found')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        // On utilise Row dans le title
        children: [
          Expanded(
            // Le texte prend l'espace minimal nécessaire
            child: Text(widget.title),
          ),
          // La barre de recherche prend l'espace restant
          Expanded(
            flex: 2, // Prend plus d'espace que le titre
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Rechercher...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
            ),
          ),
        ],
      ),
      actions: [
        // Les boutons restent dans actions
        IconButton(icon: Icon(Icons.search), onPressed: SearchOnApi42),
        IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
      ],
    );
  }
}
