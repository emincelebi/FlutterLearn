import 'package:flutter/material.dart';
import 'package:flutter_full_learn/product/language/language_items.dart';

import '../product/counter_hello_button.dart';

class StatefullLearn extends StatefulWidget {
  const StatefullLearn({super.key});

  @override
  State<StatefullLearn> createState() => _StatefullLearnState();
}

class _StatefullLearnState extends State<StatefullLearn> {
  late int _countValue = 0;
  late int _visitor = 0;

  void _updateCount(bool isIncrement) {
    if (isIncrement) {
      _countValue += 1;
    } else {
      _countValue -= 1;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LanguageItems.welcomeTitle),
      ),
      body: Column(
        children: [
          Center(
            child: Text(_countValue.toString(), style: Theme.of(context).textTheme.headline3),
          ),
          Placeholder(),
          CounterHelloButton(),
        ],
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _increamentButton(),
          _deincreamentButton(),
        ],
      ),
    );
  }

  Padding _deincreamentButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: FloatingActionButton(
        onPressed: () {
          _updateCount(false);
          print(_countValue);
        },
        child: Icon(Icons.remove),
      ),
    );
  }

  FloatingActionButton _increamentButton() {
    print('burda');
    return FloatingActionButton(
      onPressed: () {
        _updateCount(true);
        print(_countValue);
      },
      child: Icon(Icons.add),
    );
  }
}
