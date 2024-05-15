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
            height: 40,
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(49.0),
                  ),
                  filled: true,
                  fillColor: Color.fromRGBO(232, 228, 253, 1),
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search)),
            ),
          ),
          Container(
            height: 31,
            margin: EdgeInsets.only(top: 15),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                OutlinedButton(
                  onPressed: () {},
                  child: Text(
                    'All',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(
                          Color.fromRGBO(104, 73, 239, 0.7)),
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
                OutlinedButton(
                  onPressed: () {},
                  child: Text(
                    'Wireframe Design',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0)))),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Continue watching',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'See All',
                        style:
                            TextStyle(color: Color.fromRGBO(104, 73, 239, 1)),
                      )
                    ],
                  ),
                  Container(
                    height: 260,
                    child: GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: (.5),
                      children: List.generate(2, (index) {
                        return Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset('assets/images/websiteDesign.png'),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Website Design',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Icon(
                                    Icons.bookmark,
                                    color: Color.fromRGBO(104, 73, 239, 1),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.person,
                                    color: Color.fromRGBO(116, 116, 116, 1),
                                  ),
                                  Text(
                                    'By Robert James',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Color.fromRGBO(104, 73, 239, 1),
                                    size: 20,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Color.fromRGBO(104, 73, 239, 1),
                                    size: 20,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Color.fromRGBO(104, 73, 239, 1),
                                    size: 20,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Color.fromRGBO(104, 73, 239, 1),
                                    size: 20,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Color.fromRGBO(104, 73, 239, 1),
                                    size: 20,
                                  ),
                                  Text('5'),
                                ],
                              )
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Popular Courses',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'See All',
                        style:
                            TextStyle(color: Color.fromRGBO(104, 73, 239, 1)),
                      )
                    ],
                  ),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: (.5),
                      children: List.generate(2, (index) {
                        return Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset('assets/images/websiteDesign.png'),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Popular Courses',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Icon(
                                    Icons.bookmark,
                                    color: Color.fromRGBO(104, 73, 239, 1),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.person,
                                    color: Color.fromRGBO(116, 116, 116, 1),
                                  ),
                                  Text(
                                    'By Robert James',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Color.fromRGBO(104, 73, 239, 1),
                                    size: 20,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Color.fromRGBO(104, 73, 239, 1),
                                    size: 20,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Color.fromRGBO(104, 73, 239, 1),
                                    size: 20,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Color.fromRGBO(104, 73, 239, 1),
                                    size: 20,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Color.fromRGBO(104, 73, 239, 1),
                                    size: 20,
                                  ),
                                  Text('5'),
                                ],
                              )
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
