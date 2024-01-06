// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:messenger/pages/box_chat.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> users = [];

  // get data
  Future getData() async {
    var res = await http.get(Uri.parse('http://192.168.56.102:3000/api/users'));
    setState(() {
      users = json.decode(res.body);
    });
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      appBar: _appBar(context),
      body: Container(
        color: Theme.of(context).primaryColor,
        child: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            _searchBox(),
            SizedBox(
              height: 15,
            ),
            _onlineUsers(),
            SizedBox(
              height: 15,
            ),
            _mainChatBubble(),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chat_bubble_rounded,
            ),
            label: 'Đoạn chat',
            backgroundColor: Theme.of(context).primaryColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.videocam_rounded,
            ),
            label: 'Cuộc gọi',
            backgroundColor: Theme.of(context).primaryColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.contact_phone,
            ),
            label: 'Danh bạ',
            backgroundColor: Theme.of(context).primaryColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.view_carousel_rounded,
            ),
            label: 'Tin',
            backgroundColor: Theme.of(context).primaryColor,
          ),
        ],
        showUnselectedLabels: true,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        selectedItemColor: Colors.blueAccent,
        selectedIconTheme: IconThemeData(size: 20),
        unselectedIconTheme: IconThemeData(size: 20),
      ),
    );
  }

  Expanded _mainChatBubble() {
    return Expanded(
      child: ListView.separated(
        itemCount: users.length,
        padding: EdgeInsets.only(left: 10),
        scrollDirection: Axis.vertical,
        separatorBuilder: (context, index) => const SizedBox(
          height: 18,
        ),
        itemBuilder: (context, index) {
          final userInformation = users[index]['user_information_id'];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BoxChat(
                    user_id: users[index]['id'],
                  ),
                ),
              );
            },
            child: Container(
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      height: 50,
                      width: 50,
                      child: Image.asset(
                        'assets/images/avatar_images/' +
                            userInformation['user_avatar_path'],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            userInformation['user_name'],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Row(
                            children: [
                              // newest message
                              Expanded(
                                child: Text(
                                  'Đã bày tỏ cảm xúc <3 về tin nhắn của bạn',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              // Time
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Text(
                                  "14:50",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  SizedBox _onlineUsers() {
    return SizedBox(
      height: 50,
      child: ListView.separated(
        itemCount: users.length,
        padding: EdgeInsets.only(left: 10),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(
          width: 18,
        ),
        itemBuilder: (context, index) {
          final userInformation = users[index]['user_information_id'];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BoxChat(
                    user_id: users[index]['id'],
                  ),
                ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                width: 50,
                child: Image.asset(
                  'assets/images/avatar_images/' +
                      userInformation['user_avatar_path'],
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      leading: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(50),
        ),
        child: IconButton(
          onPressed: () => {},
          icon: Icon(
            color: Colors.white,
            Icons.menu,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      title: Text(
        "Đoạn chat",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      actions: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          alignment: Alignment.center,
          width: 37,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(50),
          ),
          child: IconButton(
            onPressed: () => {},
            color: Colors.white,
            icon: Icon(Icons.create_rounded),
            iconSize: 20,
          ),
        ),
      ],
    );
  }

  Padding _searchBox() {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 0),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Icon(
                Icons.search,
                size: 17,
              ),
            ),
            Text(
              'Tìm kiếm',
            )
          ],
        ),
      ),
    );
  }
}
