import 'package:flutter/material.dart';
import 'InfoRow.dart';

class ProfileUI {
  final Map<String, dynamic>? profile;

  ProfileUI(this.profile);

  Widget MainInfos() {
    return WhiteBoxContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          InfoRow(label: 'Login:', value: profile!['login']),
          InfoRow(label: 'Email:', value: profile!['email']),
          if (profile!['phone'] != null)
            InfoRow(label: 'Phone:', value: profile!['phone']),
          if (profile!['wallet'] != null)
            InfoRow(label: 'Wallet:', value: profile!['wallet'].toString()),
          if (profile!['correction_point'] != null)
            InfoRow(
              label: 'Correction Points:',
              value: profile!['correction_point'].toString(),
            ),
        ],
      ),
    );
  }

  Widget Skills() {
    if (profile == null || 
        profile!['skills'] == null || 
        (profile!['skills'] as List).isEmpty) {
      return Container();
    }
    return WhiteBoxContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Skills',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 15),
          ...((profile!['skills'] as List<dynamic>).map((skill) {
            // Vérification des données skill
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${skill['name']} - Level ${skill['level'].toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 5),
                  LinearProgressIndicator(
                    value: skill['level'] / 20, // Niveau max 20
                    backgroundColor: Colors.grey[200],
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                    minHeight: 10,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ],
              ),
            );
          }).toList()),
        ],
      ),
    );
  }
}

class WhiteBoxContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double? borderRadius;
  final Color? backgroundColor;

  const WhiteBoxContainer({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(20),
    this.margin = const EdgeInsets.all(10),
    this.borderRadius = 15,
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius!),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 255, 255, 255).withAlpha(50),
            blurRadius: 15,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }
}
