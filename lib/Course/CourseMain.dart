import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:learn_ease/Course/aboutCourse.dart';

class Course extends StatefulWidget {
  const Course({super.key});
  static const routeName = '/course';

  @override
  State<Course> createState() => _CourseState();
}

class _CourseState extends State<Course> {
  Color selectedColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Icon(
            Icons.share,
            color: Colors.white,
          ),
          Icon(
            Icons.bookmark,
            color: Colors.white,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              color: Color.fromRGBO(104, 73, 239, 0.66),
              child: Stack(
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage('assets/images/websiteDesign.png'),
                            fit: BoxFit.fill)),
                  ),
                  Center(
                    child: ElevatedButton.icon(
                      icon: Icon(
                        Icons.play_circle,
                        color: Colors.white,
                      ),
                      label: Text(
                        'Course Preview',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Color.fromRGBO(163, 163, 163, 1))),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 35,
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'About',
                      style: TextStyle(color: selectedColor),
                    ),
                    style: TextButton.styleFrom(
                        fixedSize: Size.fromWidth(120),
                        backgroundColor: Color.fromRGBO(104, 73, 239, 0.7),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0))),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Lessons',
                      style: TextStyle(color: Colors.black),
                    ),
                    style: TextButton.styleFrom(
                        fixedSize: Size.fromWidth(120),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0))),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Reviews',
                      style: TextStyle(color: Colors.black),
                    ),
                    style: TextButton.styleFrom(
                        fixedSize: Size.fromWidth(120),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0))),
                  ),
                ],
              ),
            ),
            AboutCourse()
          ],
        ),
      ),
      persistentFooterButtons: [
        Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'GET ENROLLED',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(104, 73, 239, 1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    fixedSize: Size(370, 50)),
              ),
              SizedBox(
                height: 5,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'ADD TO CART',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                    side: BorderSide(color: Colors.black),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    fixedSize: Size(370, 50)),
              )
            ],
          ),
        )
      ],
    );
  }
}
