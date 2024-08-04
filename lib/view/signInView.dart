import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:learn_ease/controller/userInfo_controller.dart';
import 'package:learn_ease/packages/loginAndReg.dart';
import 'package:learn_ease/model/userInfo.dart';
import 'package:learn_ease/screens/homePage2.dart';
import 'package:learn_ease/screens/themeData.dart';
import 'package:learn_ease/view/forgetPassView.dart';
import 'package:learn_ease/view/signUpView.dart';
import 'package:learn_ease/screens/user_profile.dart';

class SignInWidget extends StatefulWidget {
  const SignInWidget({super.key});
  static const routeName = '/sign in';

  @override
  State<SignInWidget> createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> {
  String? _email;
  String? _pass;

  final GlobalKey<FormState> _key = GlobalKey();
  final UserinfoController _userinfoController = UserinfoController();
  late Future<List<userInfo>> allUsers;
  userInfo? userData;

  String? validatePassword(String value) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (!regex.hasMatch(value)) {
      return 'Enter valid password';
    }
    return null;
  }

  userInfo findEmail(List<userInfo> list, String value) {
    List<userInfo> founded = list
        .where(
          (mapObject) => (mapObject.email as String).startsWith(value),
        )
        .toList();

    return founded.first;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allUsers = UserinfoController().getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        margin: const EdgeInsets.only(top: 70, left: 15, right: 15),
        child: FutureBuilder(
          future: allUsers,
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
              return Column(
                children: [
                  const Text(
                    'Sign In',
                    style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'Please provide us with your information in order to login your account',
                    style: TextStyle(fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Form(
                    autovalidateMode: AutovalidateMode.always,
                    key: _key,
                    child: Column(
                      children: [
                        Container(
                          height: 60,
                          child: ListTile(
                            title: Container(
                                margin: EdgeInsets.only(bottom: 7),
                                child: const Text('Email Address')),
                            titleTextStyle: TextStyle(
                              color: Colors.black,
                            ),
                            subtitle: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                ),
                                hintText: 'Contact@gmail.com',
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter your email';
                                } else if (!EmailValidator.validate(value)) {
                                  return 'Please enter valid email';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _email = value!;
                              },
                            ),
                          ),
                        ),
                        Container(
                          height: 60,
                          margin: const EdgeInsets.only(top: 30),
                          child: ListTile(
                            title: Container(
                              margin: EdgeInsets.only(bottom: 7),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Password',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, ForgetPassWidget.routeName);
                                    },
                                    child: const Text(
                                      'Forget Password?',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            subtitle: TextFormField(
                              obscureText: true,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                ),
                                hintText: '************',
                              ),
                              onSaved: (value) {
                                _pass = value!;
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter password';
                                } else if (validatePassword(value) != null) {
                                  return 'password must contains at least(8-character,Upper+Lower case,number,symbol)';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 60),
                          width: 330,
                          height: 50,
                          child: ElevatedButton(
                              onPressed: () async {
                                if (_key.currentState!.validate()) {
                                  _key.currentState!.save();

                                  userData =
                                      userInfo(email: _email, password: _pass);
                                  await _userinfoController
                                      .signIn(userData!)
                                      .then((result) {
                                    if (result) {
                                      final userSignedIn =
                                          findEmail(snapshot.data!, _email!);
                                      print(userSignedIn.id);

                                      Navigator.of(context)
                                          .pushNamedAndRemoveUntil(
                                              HomePage2.routeName,
                                              (route) => false,
                                              arguments: userSignedIn);
                                    } else {
                                      final snackBar = SnackBar(
                                        content: const Text(
                                            'Invalid email or password.'),
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                    }
                                  });
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromRGBO(104, 73, 239, 1),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                              child: const Text(
                                'SIGN IN',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              )),
                        ),
                        TextButton(
                            style: ButtonStyle(
                              foregroundColor:
                                  WidgetStateProperty.all<Color>(Colors.black),
                              overlayColor:
                                  WidgetStateProperty.resolveWith<Color?>(
                                (Set<WidgetState> states) {
                                  if (states.contains(WidgetState.pressed))
                                    return Colors.blue.withOpacity(0.15);
                                  return null; // Defer to the widget's default.
                                },
                              ),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                SignUpView.routeName,
                              );
                            },
                            child: const Text(
                                'Don’t you have an account? Sign Up')),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 150,
                  ),
                  Stack(
                    children: [
                      const Divider(
                        height: 40,
                        thickness: 1,
                        indent: 10,
                        endIndent: 25,
                        color: Colors.black,
                      ),
                      Positioned(
                          left: 140,
                          top: 10,
                          child: Container(
                              width: 120,
                              color: Colors.white,
                              child: const Text(
                                'Or Continue With',
                                textAlign: TextAlign.center,
                              )))
                    ],
                  ),
                  ElevatedButton.icon(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(53, 96, 250, 1),
                          fixedSize: Size(340, 51),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      icon: Icon(
                        Icons.facebook,
                        color: Colors.white,
                      ),
                      label: const Text(
                        'Sign In with Facebook',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.white,
                        fixedSize: Size(340, 51),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/googleLogo.png',
                          width: 40,
                          height: 40,
                        ),
                        Text('Sign In with Google',
                            style:
                                TextStyle(fontSize: 18, color: Colors.black)),
                      ],
                    ),
                  )
                ],
              );
            }
          },
        ),
      ),
    ));
  }
}

/*for (int i = 0;
                                      i < args.allUsers.length;
                                      i++) {
                                    if (_email == args.allUsers[i].email) {
                                      if (_pass == args.allUsers[i].password) {
                                        print(args.allUsers[i]);
                                        Navigator.pushNamed(
                                            context, UserProfile.routeName,
                                            arguments: args.allUsers[i]);
                                      } else {
                                        _showMyDialog(
                                            'password', 'password not correct');
                                      }
                                    } else {
                                      _showMyDialog('email',
                                          'This email is not register yet, Sign up please');
                                    }
                                  }*/