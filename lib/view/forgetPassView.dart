import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:learn_ease/controller/userInfo_controller.dart';
import 'package:learn_ease/model/userInfo.dart';
import 'package:learn_ease/view/emailVerificationView.dart';

class ForgetPassWidget extends StatefulWidget {
  const ForgetPassWidget({super.key});
  static const routeName = 'forget password widget';

  @override
  State<ForgetPassWidget> createState() => _ForgetPassWidgetState();
}

class _ForgetPassWidgetState extends State<ForgetPassWidget> {
  final UserinfoController _userinfoController = UserinfoController();
  final GlobalKey<FormState> _key = GlobalKey();
  late Future<List<userInfo>> allUsers;
  String? _email;
  bool emailExist = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allUsers = _userinfoController.getUserData();
  }

  List<userInfo> findEmail(List<userInfo> list, String value) {
    List<userInfo> founded = list
        .where(
          (mapObject) => (mapObject.email as String).startsWith(value),
        )
        .toList();
    if (founded.isEmpty) {}
    return founded;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          margin: EdgeInsets.only(top: 70, left: 15, right: 15),
          child: FutureBuilder(
              future: allUsers,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('error is : ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Text('There is no data');
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: const Text(
                          'Forget Password',
                          style: TextStyle(
                              fontSize: 34, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20, left: 15),
                        child: const Text(
                          'Email Address Here',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                      Form(
                          autovalidateMode: AutovalidateMode.always,
                          key: _key,
                          child: Column(
                            children: [
                              Container(
                                height: 60,
                                margin: EdgeInsets.only(top: 10, bottom: 30),
                                child: ListTile(
                                  title: Container(
                                      margin: EdgeInsets.only(bottom: 7),
                                      child: const Text(
                                          'Enter Your Email associate with this account')),
                                  titleTextStyle: TextStyle(
                                    color: Colors.black,
                                  ),
                                  subtitle: TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)),
                                      ),
                                      hintText: 'Contact@mail.com',
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Enter your email';
                                      } else if (!EmailValidator.validate(
                                          value)) {
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
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                emailExist ? '' : 'Email is not registered yet',
                                style: TextStyle(color: Colors.red),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 20),
                                width: 330,
                                height: 50,
                                child: ElevatedButton(
                                    onPressed: () {
                                      if (_key.currentState!.validate()) {
                                        _key.currentState!.save();
                                        List<userInfo> isEmailExist =
                                            findEmail(snapshot.data!, _email!);

                                        if (isEmailExist.isEmpty) {
                                          print('Email in not registered yet');
                                          setState(() {
                                            emailExist = false;
                                          });
                                        } else {
                                          for (userInfo registeredUser
                                              in isEmailExist) {
                                            print(registeredUser.email);
                                            setState(() {
                                              emailExist = true;
                                            });
                                            Navigator.pushNamed(
                                                context,
                                                EmailVerificationWidget
                                                    .routeName,
                                                arguments: registeredUser);
                                          }
                                          print('element is: $isEmailExist');
                                        }
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Color.fromRGBO(104, 73, 239, 1),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                    ),
                                    child: const Text(
                                      'RECOVER PASSWORD',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                      ),
                                    )),
                              ),
                            ],
                          ))
                    ],
                  );
                }
              }),
        ));
  }
}
