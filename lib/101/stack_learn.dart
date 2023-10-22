import 'package:flutter/material.dart';

class StackLearn extends StatelessWidget {
  const StackLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Container(
            color: Colors.red,
            height: 100,
          ),
          Container(
            color: Colors.blue,
            height: 50,
          ),
          Positioned(
            top: 30,
            bottom: 30,
            left: 30,
            right: 30,
            child: Container(
              color: Colors.green,
            ),
          ),
          Positioned.fill(
            child: Container(color: Colors.cyan),
            left: 20,
            right: 380,
            top: 50,
            bottom: 20,
          )
        ],
      ),
    );
  }
}
