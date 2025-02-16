import 'package:flutter/material.dart';
import 'package:swifty_companion/themes.dart';
import 'components/AppBar.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class SetScaffold extends StatefulWidget {
  final String title;
  
  const SetScaffold({super.key, required this.title});
  
  @override
  State<SetScaffold> createState() => _SetScaffoldState();
}

class _SetScaffoldState extends State<SetScaffold> {
  Map<String, dynamic>? userData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'Coucou',
        profileResult: (data) {
          setState(() {
            userData = data[0]; // On prend le premier utilisateur
          });
        },
      ),
      body: userData != null
        ? Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Photo de profil
                Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                      userData!['image']['versions']['medium']
                    ),
                  ),
                ),
                SizedBox(height: 20),
                
                // Informations de l'utilisateur
                Text(
                  userData!['usual_full_name'] ?? '${userData!['first_name']} ${userData!['last_name']}',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                
                InfoRow(label: 'Login:', value: userData!['login']),
                InfoRow(label: 'Email:', value: userData!['email']),
                InfoRow(label: 'Type:', value: userData!['kind']),
                
                // Ajoutez d'autres informations selon vos besoins
              ],
            ),
          )
        : Center(child: Text(widget.title)),
    );
  }
}

// Widget réutilisable pour afficher une ligne d'information
class InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const InfoRow({
    required this.label,
    required this.value,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(width: 8),
          Text(
            value,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  runApp(
    MaterialApp(theme: AppTheme.lightTheme, home: SetScaffold(title: 'COUCOU')),
  );
}
