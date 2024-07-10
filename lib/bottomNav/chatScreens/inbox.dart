import 'package:flutter/material.dart';

class inbox extends StatefulWidget {
  const inbox({super.key});
  static const routeName = '/inbox';

  @override
  State<inbox> createState() => _inboxState();
}

class _inboxState extends State<inbox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: -5,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.black12,
              child: CircleAvatar(
                radius: 19,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 16,
                  backgroundImage: AssetImage('assets/images/teacher1.png'),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text('Person Name'),
          ],
        ),
        actions: [
          Icon(Icons.call, color: Color.fromRGBO(104, 73, 239, 1)),
          Icon(Icons.more_vert)
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: Text('Today')),
          Container(
            width: 280,
            height: 120,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(left: 30, right: 30, top: 15),
            decoration: BoxDecoration(
                color: Color.fromRGBO(232, 228, 253, 1),
                border: Border.all(color: Color.fromRGBO(189, 178, 236, 1)),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    'Lorem ipsum dolor sit amet consectetur. Quis dictum elementum libero auctor. Morbi lacus euismod vitae'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('14:24'),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.done_all,
                      color: Color.fromRGBO(104, 73, 239, 1),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
      persistentFooterButtons: [TextField()],
    );
  }
}
