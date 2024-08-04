import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:learn_ease/Course/CourseMain.dart';
import 'package:learn_ease/controller/courseInfo_controller.dart';
import 'package:learn_ease/controller/userInfo_controller.dart';
import 'package:learn_ease/model/courseInfo.dart';
import 'package:learn_ease/model/userInfo.dart';

class HomeNav extends StatefulWidget {
  const HomeNav({super.key});

  @override
  State<HomeNav> createState() => _HomeNavState();
}

class _HomeNavState extends State<HomeNav> {
  final CourseinfoController _courseinfoController = CourseinfoController();
  late Future<List<courseInfo>> allCourses;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allCourses = CourseinfoController().getCourseInfo();
  
  }

  @override
  Widget build(BuildContext context) {
    final userInfo args = ModalRoute.of(context)!.settings.arguments as userInfo;

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: ListTile(
            title: Text('Welcome'),
            subtitle: Text(
                      args.fName!,
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
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.notifications,
              color: Color.fromRGBO(149, 128, 244, 1),
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
        body: FutureBuilder(
          future: allCourses,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('error ${snapshot.error}'),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(
                child: Text('no data'),
              );
            } else {
              return Container(
                margin: const EdgeInsets.only(right: 15, left: 15, top: 10),
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
                            fillColor: const Color.fromRGBO(232, 228, 253, 1),
                            hintText: 'Search',
                            prefixIcon: const Icon(Icons.search)),
                      ),
                    ),
                    Container(
                      height: 31,
                      margin: const EdgeInsets.only(top: 15),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          OutlinedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                                backgroundColor:
                                    const WidgetStatePropertyAll<Color>(
                                        Color.fromRGBO(104, 73, 239, 0.7)),
                                shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(0)))),
                            child: const Text(
                              'All',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          OutlinedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                                shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(0)))),
                            child: Text(
                              'UI/UX',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          OutlinedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                                shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(0)))),
                            child: Text(
                              'Website design',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          OutlinedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                                shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(0)))),
                            child: Text(
                              'App design',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          OutlinedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                                shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(0)))),
                            child: Text(
                              'Wireframe Design',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: Column(
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Continue watching',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'See All',
                                  style: TextStyle(
                                      color: Color.fromRGBO(104, 73, 239, 1)),
                                )
                              ],
                            ),
                            Container(
                              height: 280,
                              child: GridView.count(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                childAspectRatio: (.5),
                                children: List.generate(2, (index) {
                                  return Container(
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, Course.routeName,
                                            arguments: snapshot.data![index]);
                                      },
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Image.asset(
                                              'assets/images/websiteDesign.png'),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                snapshot
                                                    .data![index].courseName!,
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Icon(
                                                Icons.bookmark,
                                                color: Color.fromRGBO(
                                                    104, 73, 239, 1),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Icon(
                                                Icons.person,
                                                color: Color.fromRGBO(
                                                    116, 116, 116, 1),
                                              ),
                                              Text(
                                                snapshot.data![index]
                                                    .courseInstructor!,
                                                style: TextStyle(fontSize: 12),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              RatingBarIndicator(
                                                itemBuilder: (context, index) =>
                                                    const Icon(
                                                  Icons.star,
                                                  color: Color.fromRGBO(
                                                      104, 73, 239, 1),
                                                ),
                                                rating: snapshot
                                                    .data![index].courseRating!,
                                                itemCount: 5,
                                                itemSize: 20,
                                                direction: Axis.horizontal,
                                                unratedColor: Color.fromRGBO(
                                                    170, 154, 243, 1),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(snapshot
                                                  .data![index].courseRating!
                                                  .toString()),
                                            ],
                                          ),
                                          Container(
                                            width: double.infinity,
                                            child: Text(
                                              '70% Completed',
                                              textAlign: TextAlign.end,
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Color.fromRGBO(
                                                      116, 116, 116, 1)),
                                            ),
                                          ),
                                          LinearProgressIndicator(
                                            minHeight: 6,
                                            value: .7,
                                            color:
                                                Color.fromRGBO(254, 190, 15, 1),
                                            backgroundColor: Color.fromRGBO(
                                                217, 217, 217, 1),
                                            borderRadius:
                                                BorderRadius.circular(27),
                                          ),
                                        ],
                                      ),
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
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'See All',
                                  style: TextStyle(
                                      color: Color.fromRGBO(104, 73, 239, 1)),
                                )
                              ],
                            ),
                            Expanded(
                              child: GridView.count(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                childAspectRatio: (.5),
                                children: List.generate(2, (index) {
                                  return Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                            'assets/images/websiteDesign.png'),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              snapshot.data![index].courseName!,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Icon(
                                              Icons.bookmark,
                                              color: Color.fromRGBO(
                                                  104, 73, 239, 1),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.person,
                                              color: Color.fromRGBO(
                                                  116, 116, 116, 1),
                                            ),
                                            Text(
                                              snapshot.data![index]
                                                  .courseInstructor!,
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            RatingBarIndicator(
                                              itemBuilder: (context, index) =>
                                                  const Icon(
                                                Icons.star,
                                                color: Color.fromRGBO(
                                                    104, 73, 239, 1),
                                              ),
                                              rating: snapshot
                                                  .data![index].courseRating!,
                                              itemCount: 5,
                                              itemSize: 20,
                                              direction: Axis.horizontal,
                                              unratedColor: Color.fromRGBO(
                                                  170, 154, 243, 1),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(snapshot
                                                .data![index].courseRating!
                                                .toString()),
                                          ],
                                        ),
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
          },
        ));
  }
}
