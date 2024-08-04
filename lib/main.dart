import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:learn_ease/Course/CourseMain.dart';
import 'package:learn_ease/bottomNav/chatScreens/inbox.dart';
import 'package:learn_ease/bottomNav/myCoursesNav.dart';
import 'package:learn_ease/bottomNav/myProfileNav.dart';
import 'package:learn_ease/buyCourse/addCart.dart';
import 'package:learn_ease/buyCourse/confirmation.dart';
import 'package:learn_ease/buyCourse/overview.dart';
import 'package:learn_ease/buyCourse/paymentMethod.dart';
import 'package:learn_ease/firebase_options.dart';
import 'package:learn_ease/model/userInterest.dart';
import 'package:learn_ease/screens/homePage2.dart';
import 'package:learn_ease/screens/imageAnimation.dart';
import 'package:learn_ease/screens/optionScreen.dart';
import 'package:learn_ease/view/emailVerificationView.dart';
import 'package:learn_ease/view/forgetPassView.dart';
import 'package:learn_ease/view/resetPassView.dart';
import 'package:learn_ease/view/signInView.dart';
import 'package:learn_ease/view/signUpView.dart';
import 'package:learn_ease/screens/themeData.dart';
import 'package:learn_ease/screens/user_profile.dart';
import 'package:learn_ease/view/learnEaseView.dart';
import 'package:learn_ease/view/userInterestView.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const learnEase());
}

class learnEase extends StatelessWidget {
  const learnEase({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        OptionScreenWgt.routeName: (context) => const OptionScreenWgt(),
        '/': (context) => HomePage(),
        SignInWidget.routeName: (context) => const SignInWidget(),
        SignUpView.routeName: (context) => const SignUpView(),
        UserProfile.routeName: (context) => const UserProfile(),
        HomePage2.routeName: (context) => const HomePage2(),
        Course.routeName: (context) => const Course(),
        Overview.routeName: (context) => const Overview(),
        PaymentMethod.routeName: (context) => const PaymentMethod(),
        Confirmation.routeName: (context) => const Confirmation(),
        AddCart.routeName: (context) => const AddCart(),
        MyCoursesNav.routeName: (context) => const MyCoursesNav(),
        MyProfileNav.routeName: (context)=> MyProfileNav(),
        imageAnimation.routeName: (context) => const imageAnimation(),
        inbox.routeName: (context) => const inbox(),
        ThemeDataTest.routeName: (context) => const ThemeDataTest(),
        LearnEaseWidget.routeName: (context) => const LearnEaseWidget(),
        UserInterestWidget.routeName: (context) => const UserInterestWidget(),
        ForgetPassWidget.routeName: (context) => const ForgetPassWidget(),
        EmailVerificationWidget.routeName: (context) =>
            const EmailVerificationWidget(),
        ResetPassWidget.routeName: (context) => const ResetPassWidget(),

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
    margin: const EdgeInsets.only(right: 10),
    child: const CircleAvatar(
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          //width: 370,
          margin: const EdgeInsets.only(top: 90),
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                    width: 400,
                    height: 350,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, ThemeDataTest.routeName);
                      },
                      child: Hero(
                        tag: 'image1',
                        child: Image.asset(
                          images[currentIndex],
                        ),
                      ),
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
                  Row(
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
                                margin: const EdgeInsets.only(right: 5),
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
                  )
                ],
              ),
              const SizedBox(
                height: 70,
              ),
              Container(
                //margin: EdgeInsets.only(bottom: 40),
                width: 250,
                child: ElevatedButton(
                  onPressed: () {
                    if (buttonText == 'GO TO THE APP') {
                      Navigator.pushNamed(context, OptionScreenWgt.routeName);
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
                    backgroundColor: const MaterialStatePropertyAll(
                        Color.fromRGBO(104, 73, 239, 1)),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  ),
                  child: Text(
                    buttonText,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, SignUpView.routeName);
                },
                child: const Text('Skip',
                    style: TextStyle(
                        fontSize: 18, color: Color.fromRGBO(141, 137, 137, 1))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
