import 'package:flutter/material.dart';

class HomeNav extends StatefulWidget {
  const HomeNav({super.key});

  @override
  State<HomeNav> createState() => _HomeNavState();
}

class _HomeNavState extends State<HomeNav> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 15, left: 15, top: 20),
      child: Column(
        children: [
          SizedBox(
            height: 50,
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(49.0),
                  ),
                  filled: true,
                  fillColor: Color.fromARGB(232, 233, 235, 223),
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search)),
            ),
          ),
          Container(
            height: 50,
            margin: EdgeInsets.only(top: 20),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                OutlinedButton(
                  onPressed: () {},
                  child: Text(
                    'All',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0)))),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: Text(
                    'UI/UX',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0)))),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: Text(
                    'Website design',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0)))),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: Text(
                    'App design',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0)))),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
