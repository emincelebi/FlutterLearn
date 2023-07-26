import 'package:flutter/material.dart';

class ColorLearn extends StatelessWidget {
  const ColorLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            color: ColorItems.pumpkin,
            child: Text('data'),
          )
        ],
      ),
    );
  }
}

class ColorItems {
  final Color anzac = Color.fromRGBO(219, 174, 51, 1);
  static final Color pumpkin = Color.fromRGBO(255, 108, 15, 1);
}
