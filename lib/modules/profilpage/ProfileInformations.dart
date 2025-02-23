import 'package:flutter/material.dart';
import '../../components/AppBar.dart';
import 'WidgetsProfile.dart';

class SetScaffold extends StatelessWidget {
  final Map<String, dynamic>? profile;

  const SetScaffold({super.key, this.profile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bkgrnd.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          // Ajout du ScrollView
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        profile!['image'] != null
                            ? NetworkImage(profile!['image']['medium'])
                            : null,
                  ),
                ),
                SizedBox(height: 20),
                ProfileUI(profile).MainInfos(),
                SizedBox(height: 20),
                ProfileUI(profile).Skills(),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
