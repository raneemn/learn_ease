import 'package:flutter/material.dart';
import 'package:learn_ease/view/signInView.dart';
import 'package:learn_ease/view/signUpView.dart';

class OptionScreenWgt extends StatelessWidget {
  const OptionScreenWgt({super.key});
  static const routeName = '/page1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 370,
          margin: EdgeInsets.only(top: 100),
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                    child: Image.asset(
                      'assets/images/image7.png',
                    ),
                  ),
                  Container(
                    width: 300,
                    child: Text(
                      'Unlock a world of knowledge',
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    width: 300,
                    child: Text(
                      'Sign in or create an account to begin your learning journey',
                      style: TextStyle(fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 70),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 171,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, SignInWidget.routeName);
                        },
                        child: Text(
                          'SIGN IN',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              const Color.fromRGBO(104, 73, 239, 1)),
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 171,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, SignUpView.routeName);
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              const Color.fromRGBO(255, 255, 255, 1)),
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                          ),
                        ),
                        child: Text(
                          'SIGN UP',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
