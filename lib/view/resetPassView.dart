import 'package:flutter/material.dart';
import 'package:learn_ease/controller/userInfo_controller.dart';
import 'package:learn_ease/model/userInfo.dart';

class ResetPassWidget extends StatefulWidget {
  const ResetPassWidget({super.key});
  static const routeName = 'Reset Password Widget';

  @override
  State<ResetPassWidget> createState() => _ResetPassWidgetState();
}

class _ResetPassWidgetState extends State<ResetPassWidget> {
  final UserinfoController _userinfoController = UserinfoController();
  final GlobalKey<FormState> _key = GlobalKey();
  late Future<List<userInfo>> allUsers;
  final TextEditingController _password = TextEditingController();
  final TextEditingController? _confirmPassword = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allUsers = _userinfoController.fetchItem();
  }

  String? validatePassword(String value) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (!regex.hasMatch(value)) {
      return 'Enter valid password';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as userInfo;
    print(args);
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
                          'Reset Password',
                          style: TextStyle(
                              fontSize: 34, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20, left: 15),
                        child: const Text(
                          'Your New Password must be different from Previously used password.',
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
                                margin: const EdgeInsets.only(top: 25),
                                child: ListTile(
                                  title: const Text(
                                    'New Password',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                  subtitle: TextFormField(
                                    obscureText: true,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)),
                                      ),
                                      hintText: '************',
                                    ),
                                    controller: _password,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter password';
                                      } else if (validatePassword(value) !=
                                          null) {
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
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)),
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
                                margin: const EdgeInsets.only(top: 60),
                                width: 330,
                                height: 50,
                                child: ElevatedButton(
                                    onPressed: () {
                                      if (_key.currentState!.validate()) {
                                        _key.currentState!.save();
                                        //update password and save it in mongodb
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          const Color.fromRGBO(104, 73, 239, 1),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                    ),
                                    child: const Text(
                                      'VERIFY AND PROCEED',
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
