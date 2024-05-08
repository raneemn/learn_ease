
import 'package:flutter/material.dart';
import 'package:learn_ease/packages/loginAndReg.dart';
import 'package:learn_ease/screens/sign_up.dart';

class signIn extends StatefulWidget {
  const signIn({super.key});

  static const routeName = '/sign in';

  @override
  State<signIn> createState() => _signInState();
}

class _signInState extends State<signIn> {
  final GlobalKey<FormState> _key = GlobalKey();
  String? _email;
  String? _pass;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as UserClass;
    print('args ${args.allUsers}');
    return Scaffold(
        body: Center(
      child: Container(
        margin: const EdgeInsets.only(top: 70, left: 15, right: 15),
        child: Column(
          children: [
            const Column(
              children: [
                Text(
                  'Sign In',
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Please provide us with your information in order to login your account',
                  style: TextStyle(fontSize: 14),
                  textAlign: TextAlign.center,
                )
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Form(
                key: _key,
                child: Column(
                  children: [
                    TextFormField(
                      onSaved: (value) {
                        _email = value;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter your valid email';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        floatingLabelAlignment: FloatingLabelAlignment.start,
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelText: 'Email Address',
                        hintText: 'youremail@gmail.com',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      onSaved: (value) {
                        _pass = value;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter your password';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        floatingLabelAlignment: FloatingLabelAlignment.start,
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelText: 'Password',
                        hintText: 'Enter your password',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20, bottom: 7),
                      width: 370,
                      height: 50,
                      child: ElevatedButton(
                          onPressed: () {
                            if (_key.currentState!.validate()) {
                              _key.currentState!.save();
                              print('object');
                              for (int i = 0; i < args.allUsers.length; i++) {
                                print('for loop');
                                if (_email == args.allUsers[i]['email']) {
                                  if (_pass == args.allUsers[i]['password']) {
                                    print(args.allUsers);
                                  }
                                }
                              }
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor: const MaterialStatePropertyAll(
                                Color.fromRGBO(104, 73, 239, 1)),
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                          ),
                          child: const Text(
                            'SIGN IN',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          )),
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, signUp.routeName);
                        },
                        child: const Text('Don’t you have an account? Sign Up')),
                  ],
                ))
          ],
        ),
      ),
    ));
  }
}
