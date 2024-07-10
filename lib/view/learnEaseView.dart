import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:learn_ease/controller/learn_app_controller.dart';
import 'package:learn_ease/model/learn_item.dart';

class LearnEaseWidget extends StatefulWidget {
  const LearnEaseWidget({super.key});
  static const routeName = '/learnEase widget';

  @override
  State<LearnEaseWidget> createState() => _LearnEaseWidgetState();
}

class _LearnEaseWidgetState extends State<LearnEaseWidget> {
  final LearnEaseController _learnEaseController = LearnEaseController();
  late Future<List<LearnItem>> items;
  final GlobalKey<FormState> _key = GlobalKey();

  String courseName = '';
  String courseDescription = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    items = _learnEaseController.fetchItem();
  }

  void _addNewCourse() async {
    try {
      final newCourse =
          LearnItem(name: courseName, description: courseDescription);
      final addCourse = await _learnEaseController.addData(newCourse);
      print(addCourse);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
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
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(
                  child: Text('no data'),
                );
              } else {
                return Column(
                  children: [
                    Form(
                      key: _key,
                      child: Column(
                        children: [
                          ListTile(
                            title: Text('Course Name'),
                            subtitle: TextFormField(
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                              )),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Insert course name';
                                } else {
                                  return null;
                                }
                              },
                              onSaved: (value) {
                                courseName = value!;
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
                                  return 'Insert course description';
                                } else {
                                  return null;
                                }
                              },
                              onSaved: (value) {
                                courseDescription = value!;
                              },
                            ),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                if (_key.currentState!.validate()) {
                                  _key.currentState!.save();
                                  _addNewCourse();
                                  setState(() {
                                     items = _learnEaseController.fetchItem();
                                  });
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                fixedSize: Size(250, 50),
                              ),
                              child: const Text(
                                'Add Course',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ))
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(snapshot.data![index].name),
                              subtitle: Text(snapshot.data![index].description),
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
