import 'package:flutter/material.dart';

import 'state_learn_view_model.dart';

class StateManageLearnView extends StatefulWidget {
  const StateManageLearnView({super.key});

  @override
  State<StateManageLearnView> createState() => _StateManageLearnViewState();
}

class _StateManageLearnViewState extends StateLearnViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            changeOpacity();
          },
        ),
        appBar: AppBar(
          backgroundColor: isOpacity ? Colors.red : Colors.green,
          title: isVisible ? const Text('Visible off') : const Text('Visible on'),
        ),
        body: Center(
          child: IconButton(
            onPressed: () {
              changeVisible();
            },
            icon: const Icon(Icons.search),
          ),
        ));
  }
}
