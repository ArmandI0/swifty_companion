import 'package:flutter/material.dart';
import '../../core/models/User.dart';
import 'InfoRow.dart';



class ProfileUI {
  final User? profile;

  ProfileUI(this.profile);

  Widget MainInfos() {
    return WhiteBoxContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            profile!.usual_full_name ??
                "${profile!.first_name} ${profile!.last_name}",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          InfoRow(label: 'Login:', value: profile!.login!),
          InfoRow(label: 'Email:', value: profile!.email!),
          if (profile!.phone != null)
            InfoRow(label: 'Phone :', value: profile!.phone!),
          if (profile!.kind != null)
            InfoRow(label: 'Type:', value: profile!.kind!),
          InfoRow(
            label: 'Location:',
            value: profile!.location ?? 'Unavailable',
          ),
          if (profile!.wallet != null)
            InfoRow(label: 'Wallet:', value: profile!.wallet.toString()),
          if (profile!.correction_point != null)
            InfoRow(
              label: 'Correction Points:',
              value: profile!.correction_point.toString(),
            ),
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
