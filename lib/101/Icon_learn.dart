import 'package:flutter/material.dart';

class IconLearnView extends StatelessWidget {
  IconLearnView({super.key});
  final IconSizes iconSize = IconSizes();
  final IconColors iconColor = IconColors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello'),
      ),
      body: Column(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.message),
            color: iconColor.cinnabar,
            iconSize: iconSize.small,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.message),
            color: iconColor.cinnabar,
            iconSize: iconSize.small,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.message),
            color: iconColor.cinnabar,
            iconSize: iconSize.small,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.message),
            color: iconColor.cinnabar,
            iconSize: iconSize.small,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.message),
            color: iconColor.cinnabar,
            iconSize: iconSize.small,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.message),
            color: iconColor.cinnabar,
            iconSize: iconSize.small,
          ),
        ],
      ),
    );
  }
}

class IconSizes {
  final double small = 40;
  static const double small2x = 80;
}

class IconColors {
  final Color cinnabar = const Color(0xAAE0403E);
}
