// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:messenger/components/icon_component.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:messenger/pages/receive_profile.dart';

class BoxChat extends StatefulWidget {
  final int user_id;

  const BoxChat({
    super.key,
    required this.user_id,
  });

  @override
  State<BoxChat> createState() => _BoxChatState();
}

class _BoxChatState extends State<BoxChat> {
  bool isTextFieldNotEmpty = false;
  var user;

  // get data by id

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future getData() async {
    var res = await http.get(
      Uri.parse(
        'http://192.168.56.102:3000/api/users/' + widget.user_id.toString(),
      ),
    );
    setState(() {
      user = json.decode(res.body);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: user != null ? _appBar(context) : null,
      body: Container(
        color: Theme.of(context).primaryColor,
        child: Column(
          children: [
            Expanded(
              child: Text('asdas'),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (text) {
                      setState(() {
                        isTextFieldNotEmpty = text.isNotEmpty;
                      });
                    },
                    obscureText: false,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      hintText: "Nhắn tin",
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 5),
                  child: Icon(
                    isTextFieldNotEmpty ? Icons.send : Icons.thumb_up,
                    color: Colors.blue.shade500,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    final userInformation = user[0]['user_information_id'];
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      title: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) {
                return ReceiveProfile(
                  user: user,
                );
              },
            ),
          );
        },
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                height: 30,
                width: 30,
                child: Image.asset(
                  'assets/images/avatar_images/' +
                      userInformation['user_avatar_path'],
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(
                userInformation['user_name'],
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        IconComponent(
          iconNamel: Icons.call,
          iconSize: 20,
          user: user,
        ),
        IconComponent(
          iconNamel: Icons.videocam_rounded,
          iconSize: 20,
          user: user,
        ),
        IconComponent(
          iconNamel: Icons.settings_accessibility_rounded,
          iconSize: 20,
          user: user,
        ),
      ],
    );
  }
}
