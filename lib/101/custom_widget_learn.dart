// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomWidgetLearn extends StatelessWidget {
  const CustomWidgetLearn({super.key});

  @override
  Widget build(BuildContext context) {
    final String title = 'Food';

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                child: CustomFoodButton(
                  title: 'Food',
                  onPressed: () {},
                ),
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ),
          SizedBox(height: 100),
          CustomFoodButton(
            title: 'Food',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class _ColorsUtility {
  final Color redColor = Colors.red;
  final Color white = Colors.white;
}

class _PaddingUtility {
  final EdgeInsets normalPadding = const EdgeInsets.all(8.0);
  final EdgeInsets normal2xPadding = const EdgeInsets.all(16.0);
}

class CustomFoodButton extends StatelessWidget
    with _ColorsUtility, _PaddingUtility {
  CustomFoodButton({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);
  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: redColor,
        shape: StadiumBorder(),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: normalPadding,
        child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .subtitle2
              ?.copyWith(color: white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
