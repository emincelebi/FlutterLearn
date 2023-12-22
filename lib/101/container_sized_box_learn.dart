import 'package:flutter/material.dart';

class ContainerSizedBoxLearn extends StatelessWidget {
  const ContainerSizedBoxLearn({super.key});

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
          const SizedBox.shrink(),
          SizedBox.square(
            dimension: 50,
            child: Text('b' * 50),
          ),
          Container(
            constraints:
                const BoxConstraints(maxWidth: 150, minWidth: 100, maxHeight: 150),
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            decoration: ProjectUtility.boxDecoration,
            child: Text('a' * 2),
          ),
        ],
      ),
    );
  }
}

class ProjectUtility {
  static BoxDecoration boxDecoration = BoxDecoration(
    //color: Colors.blue,
    gradient: const LinearGradient(colors: [Colors.red, Colors.blue]),
    boxShadow: const [
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
          gradient: const LinearGradient(colors: [Colors.red, Colors.blue]),
          boxShadow: [
            const BoxShadow(
                color: Colors.green, offset: Offset(0.1, 1), blurRadius: 12)
          ],
          //shape: BoxShape.circle,
          border: Border.all(width: 10, color: Colors.red),
          borderRadius: BorderRadius.circular(10),
        );
}
