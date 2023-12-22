import 'package:flutter/material.dart';
import 'package:flutter_full_learn/core/random_image.dart';

class StackDemo extends StatelessWidget {
  const StackDemo({super.key});
  final String imageUrl = "https://picsum.photos/id/237/200/300";
  final _cardHeight = 50.0;
  final double _cardWidth = 200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Expanded(
              flex: 4,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned.fill(bottom: _cardHeight / 2, child: const RandomImage()),
                  Positioned(
                    bottom: 0,
                    height: _cardHeight,
                    width: _cardWidth,
                    child: const _cardCustom(),
                  )
                ],
              ),
            ),
            const Spacer(
              flex: 6,
            ),
          ],
        ));
  }
}

class _cardCustom extends StatelessWidget {
  const _cardCustom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
    );
  }
}
