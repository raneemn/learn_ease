import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_ease/controller/userInfo_controller.dart';
import 'package:learn_ease/model/userInfo.dart';

class MyProfileNav extends StatefulWidget {
  const MyProfileNav({super.key});
  static const routeName = '/my profile nav';

  @override
  State<MyProfileNav> createState() => _MyProfileNavState();
}

class _MyProfileNavState extends State<MyProfileNav> {
  UserinfoController _userinfoController = UserinfoController();
  //List<userInfo> user;  >>> depends on firebase i think to keep user logged in
  List profileOptions = [
    'Edit Profile',
    'Payment Option',
    'Notification Settings',
    'Dark Mode',
    'Invite Friends',
    'Security',
    'Help Center',
    'Terms and Conditions',
    'Sign Out',
  ];
  List<IconData> optionsIcons = [
    Icons.person,
    Icons.credit_card,
    Icons.notifications,
    Icons.dark_mode,
    Icons.send,
    Icons.security,
    Icons.help_center,
    Icons.indeterminate_check_box,
    Icons.logout
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: 351,
                  height: 212,
                  margin: EdgeInsets.only(top: 100),
                  padding: EdgeInsets.only(
                    top: 70,
                    left: 10,
                    right: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(232, 228, 253, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          'Farwa ali',
                          style: TextStyle(
                              fontSize: 18,
                              color: Color.fromRGBO(104, 73, 239, 1),
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Center(
                        child: Text(
                          'contact@email.com',
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      Text(
                        'About me',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'Lorem ipsum dolor sit amet consectetur. Eleifend facilisis metus enim ut mauris mus ultricies cursus. Nibh neque mus ac amet lacus vel dictumst. Nibh id odio ullamcorper auctor. Morbi lacus euismod vitae sit viverra praesent egestas ornare orci. Diam',
                        style: TextStyle(fontSize: 11, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 95,
                  child: CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage('assets/images/teacher2.png'),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: 9,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(left: 25, right: 15),
                        child: ListTile(
                          leading: Icon(
                            optionsIcons[index],
                            size: 35,
                            color: Color.fromRGBO(104, 73, 239, 1),
                          ),
                          title: Text(
                            profileOptions[index],
                            style: TextStyle(fontSize: 16),
                          ),
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                      );
                    })),
          ],
        ),
      ),
    );
  }
}
