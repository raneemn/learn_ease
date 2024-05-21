import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyCoursesNav extends StatefulWidget {
  const MyCoursesNav({super.key});

  @override
  State<MyCoursesNav> createState() => _MyCoursesNavState();
}

class _MyCoursesNavState extends State<MyCoursesNav> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 20, right: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(onPressed: () {}, child: Text('In Progress')),
              ElevatedButton(onPressed: () {}, child: Text('Completed'))
            ],
          ),
          Container(
            height: 550,
            child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    width: 351,
                    height: 108,
                    margin: EdgeInsets.only(
                      top: 10,
                    ),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(232, 228, 253, 1),
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Image.asset('assets/images/myCourse1.png'),
                          SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'UI/UX Design',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.person),
                                    Text(
                                      'By Robert James',
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.grey),
                                    ),
                                  ],
                                ),
                                Text(
                                  '70% Completed',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Color.fromRGBO(116, 116, 116, 1)),
                                ),
                                LinearProgressIndicator(
                                  minHeight: 6,
                                  value: .7,
                                  color: Color.fromRGBO(254, 190, 15, 1),
                                  backgroundColor:
                                      Color.fromRGBO(217, 217, 217, 1),
                                  borderRadius: BorderRadius.circular(27),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
/*Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'UI/UX Design',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                Icon(Icons.person),
                                Text(
                                  'By Robert James',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                ),
                              ],
                            ),
                            Container(
                              width: double.infinity,
                              child: Text(
                                '70% Completed',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Color.fromRGBO(116, 116, 116, 1)),
                              ),
                            ),
                            LinearProgressIndicator(
                              minHeight: 6,
                              value: .7,
                              color: Color.fromRGBO(254, 190, 15, 1),
                              backgroundColor: Color.fromRGBO(217, 217, 217, 1),
                              borderRadius: BorderRadius.circular(27),
                            ),
                          ],
                        )*/