import 'package:flutter/material.dart';

enum MyColor { red, blue, black }

class ColorDemos extends StatefulWidget {
  const ColorDemos({super.key, required this.initialColor});
  final Color? initialColor;
  @override
  State<ColorDemos> createState() => _ColorDemosState();
}

class _ColorDemosState extends State<ColorDemos> {
  Color? _backgroundColor;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _backgroundColor = widget.initialColor ?? Colors.yellow;
  }

  void changeBackgroundColor(Color color) {
    setState(() {
      _backgroundColor = color;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void didUpdateWidget(covariant ColorDemos oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialColor != _backgroundColor && widget.initialColor != null) {
      changeBackgroundColor(widget.initialColor!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTapBottom,
        items: const [
          BottomNavigationBarItem(icon: _BottomContainer(color: _ColorUtility._red), label: 'Red'),
          BottomNavigationBarItem(icon: _BottomContainer(color: _ColorUtility._blue), label: 'Blue'),
          BottomNavigationBarItem(icon: _BottomContainer(color: _ColorUtility._black), label: 'Black'),
        ],
        currentIndex: _selectedIndex,
      ),
    );
  }

  void _onTapBottom(int value) {
    _onItemTapped(value);
    if (value == MyColor.red.index) {
      changeBackgroundColor(_ColorUtility._red);
    } else if (value == MyColor.blue.index) {
      changeBackgroundColor(_ColorUtility._blue);
    } else {
      changeBackgroundColor(_ColorUtility._black);
    }
  }
}

class _BottomContainer extends StatelessWidget {
  const _BottomContainer({
    Key? key,
    required this.color,
  }) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        border: Border.all(width: 8),
        borderRadius: BorderRadius.circular(15),
        color: color,
      ),
    );
  }
}

class _ColorUtility {
  static const Color _red = Colors.red;
  static const Color _blue = Colors.blue;
  static const Color _black = Colors.black;
}
