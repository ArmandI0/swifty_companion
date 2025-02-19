import 'package:flutter/material.dart';
import '../../components/AppBar.dart';
import '../../core/models/User.dart';
import 'WidgetsProfile.dart';

class SetScaffold extends StatelessWidget {
  final User? profile;

  const SetScaffold({super.key, this.profile});

  @override
  Widget build(BuildContext context) {
    print(profile);
    return Scaffold(
      appBar: MyAppBar(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bkgrnd.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage:
                      profile!.image?.versions.medium != null
                          ? NetworkImage(profile!.image!.versions.medium)
                          : null,
                  child:
                      profile!.image == null
                          ? Text(profile!.login[0].toUpperCase())
                          : null,
                ),
              ),
              SizedBox(height: 20),
              ProfileUI(profile).MainInfos(),
            ],
          ),
        ),
      ),
    );
  }
}
