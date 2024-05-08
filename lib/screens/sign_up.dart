import 'package:flutter/material.dart';
import 'package:learn_ease/packages/loginAndReg.dart';

class signUp extends StatefulWidget {
  const signUp({super.key});

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  final GlobalKey<FormState> _key = GlobalKey();
  String? _email;
  String? _fName;
  String? _lName;
  String? _password;
  String? _confirmPassword;
  Map _userData = {};
  List<Map> allUsers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.only(top: 70, left: 15, right: 15),
          child: Column(
            children: [
              Column(
                children: [
                  Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Please provide us with your information in order to Create your account',
                    style: TextStyle(fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: _key,
                child: Column(
                  children: [
                    Container(
                      height: 60,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: ListTile(
                              title: Text('First Name'),
                              subtitle: TextFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                  ),
                                  hintText: 'First Name',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter your first name';
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
                              title: Text('Last Name'),
                              subtitle: TextFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                  ),
                                  hintText: 'Last Name',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter your Last name';
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
                      margin: EdgeInsets.only(top: 25),
                      height: 60,
                      child: ListTile(
                        title: Text('Email'),
                        subtitle: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            ),
                            hintText: 'Email',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter your email';
                            } else if (!value.contains("@") ||
                                !value.contains(".")) {
                              return 'please enter valid email';
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
                      margin: EdgeInsets.only(top: 20),
                      child: ListTile(
                        title: Text('Password'),
                        subtitle: TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            ),
                            hintText: 'Password',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter your password';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _password = value!;
                          },
                        ),
                      ),
                    ),
                    Container(
                      height: 60,
                      margin: EdgeInsets.only(top: 20),
                      child: ListTile(
                        title: Text('Confirm Password'),
                        subtitle: TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            ),
                            hintText: 'Re-enter the same Password',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter the same password';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _confirmPassword = value!;
                          },
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 35, bottom: 7),
                      width: 330,
                      height: 50,
                      child: ElevatedButton(
                          onPressed: () {
                            if (_key.currentState!.validate()) {
                              _key.currentState!.save();
                              _userData = {
                                'First name': _fName,
                                'Last name': _lName,
                                'email': _email,
                                'password': _password,
                                'confirm password': _confirmPassword,
                              };
                              allUsers.add(_userData);
                              Navigator.pushNamed(context, 'sign in',
                                  arguments: UserClass(allUsers));
                            } else {
                              print('Sign up failed');
                            }
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
                            'SIGN UP',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          )),
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, 'sign in');
                        },
                        child: Text('Already Have an account? Sign In')),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
