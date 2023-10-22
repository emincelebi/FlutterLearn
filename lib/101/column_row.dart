import 'package:flutter/material.dart';

class ColumnRowLearn extends StatelessWidget {
  const ColumnRowLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
              flex: 4,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.red.shade800,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.blue,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.red.shade800,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.blue,
                    ),
                  ),
                ],
              )),
          Spacer(
            flex: 2,
          ),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [Text('a'), Text('a2'), Text('a3')],
            ),
          ),
          Container(
              height: ProjectContainerSizes.cardHeight,
              child: Column(
                children: [
                  Expanded(child: Text('data')),
                  Expanded(child: Text('data')),
                  Expanded(child: Text('data')),
                  Expanded(child: Text('data')),
                ],
              ))
        ],
      ),
    );
  }
}

class ProjectContainerSizes {
  static final double cardHeight = 200;
}
