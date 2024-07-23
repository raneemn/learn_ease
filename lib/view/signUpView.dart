import 'package:flutter/material.dart';
import 'package:learn_ease/controller/userInfo_controller.dart';
import 'package:learn_ease/packages/loginAndReg.dart';
import 'package:learn_ease/model/userInfo.dart';
import 'package:learn_ease/view/forgetPassView.dart';
import 'package:learn_ease/view/signInView.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});
  static const routeName = '/sign up view';

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final GlobalKey<FormState> _key = GlobalKey();
  String? _email;
  String? _fName;
  String? _lName;
  final TextEditingController _password = TextEditingController();
  final TextEditingController? _confirmPassword = TextEditingController();
  final UserinfoController _userinfoController = UserinfoController();
  late Future<List<userInfo>> userData;

  List<userInfo> allUsers = [];

  String? validatePassword(String value) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (!regex.hasMatch(value)) {
      return 'Enter valid password';
    }
    return null;
  }

  Future<String?> register(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return null;
    } on FirebaseAuthException catch (ex) {
      print(ex.message);
      return '${ex.code}: ${ex.message}';
    }
  }

  void addUserInfo() async {
    try {
      final newUser = userInfo(
          fName: _fName,
          lName: _lName,
          email: _email,
          password: _password.text);
      final addUser = await _userinfoController.addUserInfo(newUser);

      print(newUser.password);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.only(top: 50, left: 10, right: 10),
          child: Column(
            children: [
              Text(
                'Sign Up',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Text(
                'Please provide us with your information in order to Create your account',
                style: TextStyle(fontSize: 14, color: Colors.black),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              Form(
                autovalidateMode: AutovalidateMode.always,
                key: _key,
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: ListTile(
                              title: Container(
                                  margin: EdgeInsets.only(bottom: 7),
                                  child: const Text('First Name')),
                              titleTextStyle: TextStyle(
                                color: Colors.black,
                              ),
                              subtitle: TextFormField(
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                  ),
                                  hintText: 'First Name',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter your first name';
                                  } else if (value.length <= 2) {
                                    return 'Too short, must be 3-characters at least';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _fName = value!;
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: ListTile(
                              title: Container(
                                  margin: EdgeInsets.only(bottom: 7),
                                  child: const Text('Last Name')),
                              titleTextStyle: TextStyle(
                                color: Colors.black,
                              ),
                              subtitle: TextFormField(
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                  ),
                                  hintText: 'Last Name',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter your Last name';
                                  } else if (value.length <= 2) {
                                    return 'Too short, must be 3-characters at least';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _lName = value!;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 25),
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
                      margin: const EdgeInsets.only(top: 25),
                      child: ListTile(
                        title: const Text(
                          'Password',
                          style: TextStyle(
                            color: Colors.black,
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
                          controller: _password,
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
                      height: 60,
                      margin: const EdgeInsets.only(top: 25),
                      child: ListTile(
                        title: Container(
                            margin: EdgeInsets.only(bottom: 7),
                            child: const Text('Confirm Password')),
                        titleTextStyle: TextStyle(
                          color: Colors.black,
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
                          controller: _confirmPassword,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter the same password';
                            } else if (value != _password.text) {
                              return 'password not match';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 40),
                      width: 330,
                      height: 50,
                      child: ElevatedButton(
                          onPressed: () {
                            if (_key.currentState!.validate()) {
                              _key.currentState!.save();
                              addUserInfo();
                              Navigator.pushNamed(
                                  context, SignInWidget.routeName);
                              // for firebase register
                              /*register(
                                  _email!,
                                  _password!
                                      .toString()); */
                            } else {
                              print('Sign up failed');
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromRGBO(104, 73, 239, 1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                          ),
                          child: const Text(
                            'SIGN UP',
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
                          overlayColor: WidgetStateProperty.resolveWith<Color?>(
                            (Set<WidgetState> states) {
                              if (states.contains(WidgetState.pressed))
                                return Colors.blue.withOpacity(0.12);
                              return null; // Defer to the widget's default.
                            },
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, SignInWidget.routeName,
                              arguments: UserClass(allUsers));
                        },
                        child: const Text('Already Have an account? Sign In')),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
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
                        style: TextStyle(fontSize: 18, color: Colors.black)),
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
