import 'package:flutter/material.dart';

class ContainerSizedBoxLearn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            width: 300,
            height: 200,
            child: Text('a' * 700),
          ),
          SizedBox.shrink(),
          SizedBox.square(
            dimension: 50,
            child: Text('b' * 50),
          ),
          Container(
            constraints:
                BoxConstraints(maxWidth: 150, minWidth: 100, maxHeight: 150),
            child: Text('a' * 2),
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            decoration: ProjectUtility.boxDecoration,
          ),
        ],
      ),
    );
  }
}

class ProjectUtility {
  static BoxDecoration boxDecoration = BoxDecoration(
    //color: Colors.blue,
    gradient: LinearGradient(colors: [Colors.red, Colors.blue]),
    boxShadow: [
      BoxShadow(color: Colors.green, offset: Offset(0.1, 1), blurRadius: 12)
    ],
    //shape: BoxShape.circle,
    border: Border.all(width: 10, color: Colors.red),
    borderRadius: BorderRadius.circular(10),
  );
}

class ProjectContainerDecoration extends BoxDecoration {
  ProjectContainerDecoration()
      : super(
          //color: Colors.blue,
          gradient: LinearGradient(colors: [Colors.red, Colors.blue]),
          boxShadow: [
            BoxShadow(
                color: Colors.green, offset: Offset(0.1, 1), blurRadius: 12)
          ],
          //shape: BoxShape.circle,
          border: Border.all(width: 10, color: Colors.red),
          borderRadius: BorderRadius.circular(10),
        );
}
