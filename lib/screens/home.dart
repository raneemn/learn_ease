import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:learn_ease/bottomNav/homeNav.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({super.key});
  static const routeName = '/home page2';

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const ListTile(
          title: Text('Welcome'),
          subtitle: Text(
            'UserName',
            style: TextStyle(
                color: const Color.fromRGBO(104, 73, 239, 1),
                fontSize: 20,
                fontWeight: FontWeight.w600),
          ),
        ),
        actions: const [
          Icon(
            Icons.shopping_cart,
            color: Color.fromRGBO(149, 128, 244, 1),
          ),
          Icon(
            Icons.notifications,
            color: Color.fromRGBO(149, 128, 244, 1),
          )
        ],
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
        child: BottomNavigationBar(
          selectedItemColor: Colors.white,
          backgroundColor: const Color.fromRGBO(104, 73, 239, 1),
          iconSize: 25,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Color.fromRGBO(218, 218, 218, 1),
                ),
                label: '',
                backgroundColor: Color.fromRGBO(104, 73, 239, 1)),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: Color.fromRGBO(218, 218, 218, 1),
              ),
              label: '',
              backgroundColor: Color.fromRGBO(104, 73, 239, 1),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.school,
                color: Color.fromRGBO(218, 218, 218, 1),
              ),
              label: '',
              backgroundColor: Color.fromRGBO(104, 73, 239, 1),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.chat,
                color: Color.fromRGBO(218, 218, 218, 1),
              ),
              label: '',
              backgroundColor: Color.fromRGBO(104, 73, 239, 1),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Color.fromRGBO(218, 218, 218, 1),
              ),
              label: '',
              backgroundColor: Color.fromRGBO(104, 73, 239, 1),
            ),
          ],
        ),
      ),
      body: HomeNav(),
    );
  }
}
