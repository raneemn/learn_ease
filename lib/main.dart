import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:learn_ease/screens/page1.dart';
import 'package:learn_ease/screens/sign_in.dart';
import 'package:learn_ease/screens/sign_up.dart';

void main() {
  runApp(const learnEase());
}

class learnEase extends StatelessWidget {
  const learnEase({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'page1': (context) => Page1(),
        '/': (context) => HomePage(),
        'sign in': (context) => signIn(),
        'sign up': (context) => signUp(),
      },
      initialRoute: '/',
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List images = [
    'assets/images/image.png',
    'assets/images/image2.png',
    'assets/images/image3.png',
    'assets/images/image4.png',
    'assets/images/image5.png',
    'assets/images/image6.png',
  ];
  List title = [
    'Welcome to LearnEase',
    'Expert-Led Lectures',
    'Interactive Learning',
    'Connect with Tutors',
    'Track Your Progress',
    'Earn Certificates',
  ];
  List subTitle = [
    'Explore high-quality courses and learn at your own pace',
    'Access recorded lectures by industry experts to master essential skills and concepts',
    'Submit assignments directly through the app and receive personalized feedback from tutors',
    'Utilize direct chat for instant support and guidance anytime you need it',
    'Submit assignments directly through the app and receive personalized feedback from tutors',
    'Obtain industry-recognized certifications to showcase your skills and expertise to the world',
  ];
  int currentIndex = 0;
  String buttonText = 'NEXT';
  Color selectedColor = Colors.blue;

  Widget circleAvatar = Container(
    margin: EdgeInsets.only(right: 10),
    child: CircleAvatar(
      backgroundColor: Colors.grey,
      radius: 5,
    ),
  );

  List<Widget> theList = [];
  void _buildList() {
    for (int i = 0; i < images.length; i++) {
      theList.add(circleAvatar);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    _buildList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          //width: 370,
          margin: EdgeInsets.only(top: 90),
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                    width: 400,
                    height: 350,
                    child: Image.asset(
                      images[currentIndex],
                    ),
                  ),
                  Container(
                    width: 300,
                    child: Text(
                      title[currentIndex],
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    width: 300,
                    child: Text(
                      subTitle[currentIndex],
                      style: TextStyle(fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: images.length * 20,
                        height: 50,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: images.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                margin: EdgeInsets.only(right: 5),
                                child: CircleAvatar(
                                  backgroundColor: index == currentIndex
                                      ? selectedColor
                                      : Colors.grey,
                                  radius: 5,
                                ),
                              );
                            }),
                      ),
                    ],
                  ))
                ],
              ),
              SizedBox(
                height: 70,
              ),
              Container(
                //margin: EdgeInsets.only(bottom: 40),
                width: 250,
                child: ElevatedButton(
                  onPressed: () {
                    if (currentIndex == images.length - 1) {
                      Navigator.pushNamed(context, 'page1');
                    }
                    setState(() {
                      if (currentIndex < images.length - 1) {
                        currentIndex += 1;
                      }
                      if (currentIndex == images.length - 1) {
                        buttonText = 'GO TO THE APP';
                      }
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        const Color.fromRGBO(104, 73, 239, 1)),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  ),
                  child: Text(
                    buttonText,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'page1');
                },
                child: Text('Skip',
                    style: TextStyle(
                        fontSize: 18,
                        color: const Color.fromRGBO(141, 137, 137, 1))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
