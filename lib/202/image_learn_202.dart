import 'package:flutter/material.dart';

class ImageLearnView extends StatefulWidget {
  const ImageLearnView({super.key});

  @override
  State<ImageLearnView> createState() => _ImageLearnViewState();
}

class _ImageLearnViewState extends State<ImageLearnView> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: ImagePaths.image_collection.toWidget(height: 100),
    );
  }
}

enum ImagePaths {
  // ignore: constant_identifier_names
  image_collection
}

extension ImagePathsExtension on ImagePaths {
  String path() {
    return 'assets/png/$name.png';
  }

  Widget toWidget({double height = 24}) {
    return Image.asset(path(), height: height);
  }
}
