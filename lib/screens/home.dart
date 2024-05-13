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
                color: Colors.purple,
                fontSize: 20,
                fontWeight: FontWeight.w600),
          ),
        ),
        actions: const [
          Icon(
            Icons.shopping_cart,
            color: Colors.purple,
          ),
          Icon(
            Icons.notifications,
            color: Colors.purple,
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Color.fromARGB(255, 212, 208, 208),
              ),
              label: '',
              backgroundColor: Colors.purple),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: Color.fromARGB(255, 212, 208, 208),
              ),
              label: '',
              backgroundColor: Colors.purple),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.school,
                color: Color.fromARGB(255, 212, 208, 208),
              ),
              label: '',
              backgroundColor: Colors.purple),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.chat,
                color: Color.fromARGB(255, 212, 208, 208),
              ),
              label: '',
              backgroundColor: Colors.purple),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Color.fromARGB(255, 212, 208, 208),
              ),
              label: '',
              backgroundColor: Colors.purple),
        ],
      ),
      body: HomeNav(),
    );
  }
}
