import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:learn_ease/controller/userInterest_controller.dart';
import 'package:learn_ease/model/UserInterest.dart';

class UserInterestWidget extends StatefulWidget {
  const UserInterestWidget({super.key});
  static const routeName = '/UserInterest widget';

  @override
  State<UserInterestWidget> createState() => _UserInterestWidgetState();
}

class _UserInterestWidgetState extends State<UserInterestWidget> {
  final UserInterestController _userInterestController =
      UserInterestController();
  late Future<dynamic> items;
  final GlobalKey<FormState> _key = GlobalKey();
  final GlobalKey<FormState> _key2 = GlobalKey();

  String userName = '';
  String userInterest = '';
  String Description = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    items = UserInterestController().fetchItem();
  }

  void _addNewUser() async {
    try {
      final newUser = UserInterest(
          userName: userName, interest: userInterest, description: Description);
      final addCourse = await _userInterestController.addData(newUser);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    Future<void> updateDialog(
        String id, String userNameUp, String interestUp, String descUp) async {
      return showDialog<void>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text(
            userNameUp,
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            Form(
                key: _key2,
                child: Column(
                  children: [
                    ListTile(
                      title: const Text('Username'),
                      subtitle: TextFormField(
                        decoration: InputDecoration(
                            hintText: userNameUp,
                            border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            )),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Insert username';
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) {
                          userName = value!;
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text('Interest'),
                      subtitle: TextFormField(
                        decoration: InputDecoration(
                            hintText: interestUp,
                            border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            )),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Insert interest';
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) {
                          userInterest = value!;
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text('Description'),
                      subtitle: TextFormField(
                        decoration: InputDecoration(
                            hintText: descUp,
                            border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            )),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Insert description';
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) {
                          Description = value!;
                        },
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (_key2.currentState!.validate()) {
                            _key2.currentState!.save();
                            _userInterestController.updateData(
                                id, userName, userInterest, Description);

                            Navigator.pop(context);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          fixedSize: Size(250, 50),
                        ),
                        child: const Text(
                          'Update',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ))
                  ],
                ))
          ],
        ),
      );
    }

    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50),
        width: double.infinity,
        height: double.infinity,
        child: FutureBuilder(
            future: items,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('error ${snapshot.error}'),
                );
              } else {
                return Column(
                  children: [
                    Form(
                      key: _key,
                      child: Column(
                        children: [
                          ListTile(
                            title: Text('Username'),
                            subtitle: TextFormField(
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                              )),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Insert username';
                                } else {
                                  return null;
                                }
                              },
                              onSaved: (value) {
                                userName = value!;
                              },
                            ),
                          ),
                          ListTile(
                            title: Text('Interest'),
                            subtitle: TextFormField(
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                              )),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Insert interest';
                                } else {
                                  return null;
                                }
                              },
                              onSaved: (value) {
                                userInterest = value!;
                              },
                            ),
                          ),
                          ListTile(
                            title: Text('Description'),
                            subtitle: TextFormField(
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                              )),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Insert description';
                                } else {
                                  return null;
                                }
                              },
                              onSaved: (value) {
                                Description = value!;
                              },
                            ),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                if (_key.currentState!.validate()) {
                                  _key.currentState!.save();
                                  _addNewUser();
                                  setState(() {
                                    items = _userInterestController.fetchItem();
                                  });
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                fixedSize: Size(250, 50),
                              ),
                              child: const Text(
                                'Add new interest',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ))
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 100,
                          margin: const EdgeInsets.only(
                            left: 10,
                          ),
                          child: const Text(
                            'Username',
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        const SizedBox(
                          width: 95,
                          child: Text(
                            'Interest',
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        const SizedBox(
                          width: 95,
                          child: Text(
                            'Description',
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.only(
                                left: 15,
                              ),
                              child: Row(
                                //mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      width: 90,
                                      margin: const EdgeInsets.only(right: 10),
                                      child:
                                          Text(snapshot.data![index].userName)),
                                  Container(
                                      width: 95,
                                      margin: const EdgeInsets.only(right: 10),
                                      child:
                                          Text(snapshot.data![index].interest)),
                                  SizedBox(
                                      width: 95,
                                      child: Text(
                                          snapshot.data![index].description)),
                                  IconButton(
                                    iconSize: 20,
                                    onPressed: () async {
                                      await updateDialog(
                                        snapshot.data![index].id,
                                        snapshot.data![index].userName,
                                        snapshot.data![index].interest,
                                        snapshot.data![index].description,
                                      );
                                      setState(() {
                                        items =
                                            _userInterestController.fetchItem();
                                      });
                                    },
                                    icon: Icon(Icons.update),
                                    color: Colors.blue,
                                  ),
                                  IconButton(
                                    iconSize: 20,
                                    onPressed: () async {
                                      await _userInterestController
                                          .deleteInterest(
                                              snapshot.data![index].id);
                                      setState(() {
                                        items =
                                            _userInterestController.fetchItem();
                                      });
                                    },
                                    icon: Icon(Icons.delete),
                                    color: Colors.red,
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                  ],
                );
              }
            }),
      ),
    );
  }
}
