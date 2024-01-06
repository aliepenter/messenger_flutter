import 'package:flutter/material.dart';
import 'package:messenger/pages/receive_profile.dart';

class IconComponent extends StatelessWidget {
  final IconData iconNamel;
  final double iconSize;
  final dynamic user;
  const IconComponent({
    super.key,
    required this.iconNamel,
    required this.iconSize,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.center,
      width: 37,
      child: IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ReceiveProfile(user: user),
            ),
          );
        },
        icon: Icon(iconNamel),
        iconSize: iconSize,
      ),
    );
  }
}
