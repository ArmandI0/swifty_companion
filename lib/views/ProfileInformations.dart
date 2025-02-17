import 'package:flutter/material.dart';
import '../components/AppBar.dart';
import '../Models/User.dart';

class SetScaffold extends StatefulWidget {
  final String title;
  final User? profile;

  const SetScaffold({super.key, required this.title, this.profile});

  @override
  State<SetScaffold> createState() => _SetScaffoldState();
}

class _SetScaffoldState extends State<SetScaffold> {
  User? userData;

  @override
  void initState() {
    super.initState();
    if (widget.profile != null) {
      userData = widget.profile;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'Swifty Companion',
        profileResult: (data) {
          setState(() {
            userData = data;
          });
        },
      ),
      body:
          userData != null
              ? Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage:
                            userData!.image?.versions.medium != null
                                ? NetworkImage(userData!.image!.versions.medium)
                                : null,
                        child:
                            userData!.image == null
                                ? Text(userData!.login[0].toUpperCase())
                                : null,
                      ),
                    ),
                    SizedBox(height: 20),

                    Text(
                      userData!.usual_full_name ??
                          "${userData!.first_name} ${userData!.last_name}",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),

                    InfoRow(label: 'Login:', value: userData!.login),
                    InfoRow(label: 'Email:', value: userData!.email),
                    if (userData!.kind != null)
                      InfoRow(label: 'Type:', value: userData!.kind!),
                    InfoRow(
                      label: 'Location:',
                      value: userData!.location ?? 'Unavailable',
                    ),
                    if (userData!.wallet != null)
                      InfoRow(
                        label: 'Wallet:',
                        value: userData!.wallet.toString(),
                      ),
                    if (userData!.correction_point != null)
                      InfoRow(
                        label: 'Correction Points:',
                        value: userData!.correction_point.toString(),
                      ),
                  ],
                ),
              )
              : Center(child: Text(widget.title)),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const InfoRow({required this.label, required this.value, Key? key})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(width: 8),
            Expanded(
              child: Text(
                value,
                style: TextStyle(fontSize: 16),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
