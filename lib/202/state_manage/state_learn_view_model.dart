import 'package:flutter/material.dart';

import 'state_manage_learn_view.dart';

abstract class StateLearnViewModel extends State<StateManageLearnView> {
  bool isVisible = false;
  bool isOpacity = false;
  @override
  void initState() {
    super.initState();
  }

  void changeVisible() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  void changeOpacity() {
    setState(() {
      isOpacity = !isOpacity;
    });
  }
}
