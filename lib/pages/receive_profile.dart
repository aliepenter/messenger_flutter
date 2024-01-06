// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_interpolation_to_compose_strings

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
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tùy chỉnh',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Chủ đề',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Center(
                        child: Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            color: Colors.blue.shade500,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Container(
                              height: 7,
                              width: 7,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Cảm xúc nhanh',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Icon(
                        Icons.thumb_up,
                        color: Colors.blue.shade500,
                        size: 20,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    'Biệt danh',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    'Quyền riêng tư và hỗ trợ',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Chặn',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade700,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.block,
                          color: Colors.white,
                          size: 16,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
