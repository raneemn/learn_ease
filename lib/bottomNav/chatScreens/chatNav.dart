import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:learn_ease/bottomNav/chatScreens/inbox.dart';

class ChatNav extends StatefulWidget {
  const ChatNav({super.key});

  @override
  State<ChatNav> createState() => _ChatNavState();
}

class _ChatNavState extends State<ChatNav> {
  Color selectedColor = Colors.white;
  Color selectedBGcolor = Color.fromRGBO(104, 73, 239, 0.7);
  int _currentIndex = 0;

  void onButtonTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(49.0),
                    ),
                    filled: true,
                    fillColor: Color.fromRGBO(232, 228, 253, 1),
                    hintText: 'Search',
                    hintStyle: TextStyle(
                        fontSize: 12, color: Color.fromRGBO(141, 137, 137, 1)),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Color.fromRGBO(104, 73, 239, 1),
                    )),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Active',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 60,
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.black12,
                    child: CircleAvatar(
                        radius: 29,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.add,
                          size: 45,
                          color: Color.fromRGBO(197, 194, 194, 1),
                        )),
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.zero,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Container(
                            width: 65,
                            child: CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.black12,
                              child: CircleAvatar(
                                radius: 29,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  radius: 27,
                                  backgroundImage:
                                      AssetImage('assets/images/teacher1.png'),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(168, 34),
                        backgroundColor:
                            _currentIndex == 0 ? selectedBGcolor : Colors.white,
                      ),
                      onPressed: () {
                        onButtonTap(0);
                      },
                      child: Text(
                        'Chats',
                        style: TextStyle(
                            fontSize: 16,
                            color: _currentIndex == 0
                                ? selectedColor
                                : Colors.black),
                      )),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(168, 34),
                        backgroundColor:
                            _currentIndex == 1 ? selectedBGcolor : Colors.white,
                      ),
                      onPressed: () {
                        onButtonTap(1);
                      },
                      child: Text(
                        'Calls',
                        style: TextStyle(
                            fontSize: 16,
                            color: _currentIndex == 1
                                ? selectedColor
                                : Colors.black),
                      ))
                ],
              ),
            ),
            Expanded(child: _currentIndex == 0 ? chatsButton() : callsButton())
          ],
        ),
      ),
    );
  }
}

class chatsButton extends StatefulWidget {
  const chatsButton({super.key});

  @override
  State<chatsButton> createState() => _chatsButtonState();
}

class _chatsButtonState extends State<chatsButton> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.zero,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, inbox.routeName);
                },
                child: ListTile(
                  dense: true,
                  visualDensity: VisualDensity(horizontal: 4, vertical: 4),
                  contentPadding: EdgeInsets.only(
                    left: 2,
                    right: 5,
                  ),
                  horizontalTitleGap: -2,
                  leading: CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.black12,
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 28,
                        backgroundImage:
                            AssetImage('assets/images/teacher1.png'),
                      ),
                    ),
                  ),
                  title: Text(
                    'Name Here',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(
                    'Hi, Good Morning. How are you?',
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.w400),
                  ),
                  trailing: Column(
                    children: [
                      Text(
                        '11:23 a.m.',
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w400),
                      ),
                      CircleAvatar(
                          radius: 13,
                          backgroundColor: Color.fromRGBO(104, 73, 239, 1),
                          child: Text(
                            '02',
                            style: TextStyle(fontSize: 10, color: Colors.white),
                          ))
                    ],
                  ),
                ),
              ),
              Divider(
                height: 20,
                thickness: .3,
                color: Colors.black,
              )
            ],
          );
        });
  }
}

class callsButton extends StatefulWidget {
  const callsButton({super.key});

  @override
  State<callsButton> createState() => _callsButtonState();
}

class _callsButtonState extends State<callsButton> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.zero,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                  dense: true,
                  visualDensity: VisualDensity(horizontal: 4, vertical: 4),
                  contentPadding: EdgeInsets.only(
                    left: 2,
                    right: 5,
                  ),
                  horizontalTitleGap: -2,
                  leading: CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.black12,
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 28,
                        backgroundImage:
                            AssetImage('assets/images/teacher1.png'),
                      ),
                    ),
                  ),
                  title: Text(
                    'Name Here',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  subtitle: Container(
                    child: Row(
                      children: [
                        Icon(Icons.arrow_outward),
                        SizedBox(
                          width: 10,
                        ),
                        Text('11:23 a.m.',
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.w400))
                      ],
                    ),
                  ),
                  trailing: Icon(
                    Icons.call,
                    color: Color.fromRGBO(104, 73, 239, 1),
                  )),
              Divider(
                height: 20,
                thickness: .3,
                color: Colors.black,
              )
            ],
          );
        });
  }
}
