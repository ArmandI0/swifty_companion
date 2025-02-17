import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
export 'AppBar.dart';
import '../tools/Requests.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final Function(List<dynamic>) profileResult;

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
    print(nickname);
    final url = "https://api.intra.42.fr/v2/users?filter[login]=$nickname";

    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print(data);
      widget.profileResult(data);
    } else {
      print("ERROR: ${response.statusCode}");
      return null;
    }

    final String? Secret = dotenv.env['SECRET'];
    print(Secret);
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
