import 'package:flutter/material.dart';

class ImageLearn extends StatelessWidget {
  const ImageLearn({super.key});
  final String imagepath =
      "https://trthaberstatic.cdn.wp.trt.com.tr/resimler/1966000/trabzonspor-1966423.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            width: 300,
            height: 200,
            child: PngImage(name: ImageItems().appleBookWithoutPath),
          ),
          Image.network(imagepath,
              errorBuilder: (context, error, stackTrace) =>
                  PngImage(name: ImageItems().appleBookWithoutPath))
        ],
      ),
    );
  }
}

class ImageItems {
  final String appleBook = "assets/png/ic_apple_book.png";
  final String appleBookWithoutPath = "ic_apple_book";
  final String appleSchool = "assets/ic_apple_school.png";
}

class PngImage extends StatelessWidget {
  const PngImage({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      _nameWithPath,
      fit: BoxFit.contain,
    );
  }

  String get _nameWithPath => 'assets/png/$name.png';
}
