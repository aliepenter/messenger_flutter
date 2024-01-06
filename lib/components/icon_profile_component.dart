import 'package:flutter/material.dart';

class IconProfileComponent extends StatelessWidget {
  final IconData iconNamel;
  final String name;
  final dynamic user;
  const IconProfileComponent({
    super.key,
    required this.iconNamel,
    required this.name,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.grey.shade800,
              borderRadius: BorderRadius.circular(50)),
          child: Icon(
            iconNamel,
            color: Colors.white,
            size: 15,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          name,
          style: TextStyle(
            color: Colors.white,
            fontSize: 10,
          ),
        ),
      ],
    );
  }
}
