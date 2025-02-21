import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../profilpage/ProfileInformations.dart';
import '../../core/services/requests/Requests.user.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _searchController = TextEditingController();
  bool _disableButton = false;

  void navigateToProfile() async {
    setState(() {
      _disableButton = true;
    });
    Map<String, dynamic>? userData = await SearchOnApi42(
      _searchController.text,
    );
    if (userData != null) {
      setState(() {
        _disableButton = false;
      });
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SetScaffold(profile: userData)),
      );
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(
            SnackBar(
              duration: Duration(milliseconds: 1500), // Durée personnalisée
              backgroundColor: Colors.red[900],
              content: Text(
                'User not found',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
          .closed
          .then((reason) {
            setState(() {
              _disableButton = false;
            });
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bkgrnd.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment
                    .center, // Centre verticalement les éléments de la Column
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/42_logo.svg', width: 150, height: 150),
              SizedBox(height: 30),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'User Finders',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: "Search an user",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),

              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ElevatedButton(
                  onPressed:
                      _disableButton ? null : () => {navigateToProfile()},
                  child: Text('Lancer la recherche'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
