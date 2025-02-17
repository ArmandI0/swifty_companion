import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'ProfileInformations.dart';
import '../tools/Requests.user.dart';
import '../Models/User.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _searchController = TextEditingController();

  void navigateToProfile() async {
    User? user = await SearchOnApi42(_searchController.text);
    if (user != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SetScaffold(title: 'Profile', profile: user),
        ),
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('User not found')));
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
                  onPressed: () => {navigateToProfile()},
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
