// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:messenger/components/icon_profile_component.dart';

class ReceiveProfile extends StatefulWidget {
  final dynamic user;
  const ReceiveProfile({
    super.key,
    required this.user,
  });

  @override
  State<ReceiveProfile> createState() => _ReceiveProfileState();
}

class _ReceiveProfileState extends State<ReceiveProfile> {
  @override
  Widget build(BuildContext context) {
    final userInformation = widget.user[0]['user_information_id'];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        color: Theme.of(context).primaryColor,
        child: Column(
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  height: 100,
                  width: 100,
                  child: Image.asset(
                    'assets/images/avatar_images/' +
                        userInformation['user_avatar_path'],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              userInformation['user_name'],
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconProfileComponent(
                  iconNamel: Icons.phone,
                  name: 'Gọi thoại',
                  user: '',
                ),
                SizedBox(
                  width: 25,
                ),
                IconProfileComponent(
                  iconNamel: Icons.videocam_rounded,
                  name: 'Gọi video',
                  user: '',
                ),
                SizedBox(
                  width: 15,
                ),
                IconProfileComponent(
                  iconNamel: Icons.notifications,
                  name: 'Tắt thông báo',
                  user: '',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
