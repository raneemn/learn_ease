import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:learn_ease/model/courseInfo.dart';

class LessonsCourse extends StatefulWidget {
  const LessonsCourse({super.key});

  @override
  State<LessonsCourse> createState() => _LessonsCourseState();
}

class _LessonsCourseState extends State<LessonsCourse> {
  @override
  Widget build(BuildContext context) {
    final courseInfo args =
        ModalRoute.of(context)!.settings.arguments as courseInfo;
    return Container(
      margin: EdgeInsets.only(top: 15, left: 20, right: 20),
      child: Column(
        children: [
          SizedBox(
            height: 15,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.person,
                  color: Color.fromRGBO(104, 73, 239, 1),
                ),
                Text(
                  args.courseInstructor!,
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.book_outlined,
                  color: Color.fromRGBO(104, 73, 239, 1),
                ),
                Text(
                  '${args.numOfLessons} Lessons',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.timelapse,
                  color: Color.fromRGBO(104, 73, 239, 1),
                ),
                Text(
                  args.totalLengthHours!,
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            height: 450,
            child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: int.parse(args.numOfLessons!),
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(top: 5),
                    width: 350,
                    height: 60,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(232, 228, 253, 1),
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      dense: true,
                      visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                      contentPadding:
                          EdgeInsets.only(top: 1, left: 10, right: 20),
                      horizontalTitleGap: -6,
                      isThreeLine: true,
                      leading: Text(
                        '${index + 1}.',
                        style: TextStyle(fontSize: 14),
                      ),
                      title: Text(
                        ' Lesson ${index + 1}',
                        style: TextStyle(fontSize: 14),
                      ),
                      subtitle: Text(
                        '15:00',
                        style: TextStyle(fontSize: 14),
                      ),
                      trailing: Icon(
                        Icons.play_circle,
                        color: Color.fromRGBO(104, 73, 239, 1),
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
 
         /* CustomScrollView(
      slivers: <Widget>[
        SliverPersistentHeader(
          delegate:
        SliverFixedExtentList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ListTile(
                  leading: Text('$index .'),
                  title: Text('Introduction to Website Design?'),
                  subtitle: Text('3:45'),
                  trailing: Icon(Icons.play_circle),
                );
              },
            ),
            itemExtent: 100)
      ],
    );*/