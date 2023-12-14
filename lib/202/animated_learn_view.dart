import 'package:flutter/material.dart';

const double kZero = 0;

class AnimatedLearnView extends StatefulWidget {
  const AnimatedLearnView({super.key});

  @override
  State<AnimatedLearnView> createState() => _AnimatedLearnViewState();
}

class _AnimatedLearnViewState extends State<AnimatedLearnView> with TickerProviderStateMixin {
  //Text('data', style: context.textTheme().titleMedium),
  bool _isVisible = false;
  bool _isOpacity = false;
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: _DurationItems.durationLow);
    super.initState();
  }

  void _changeVisible() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  void _changeOpacity() {
    setState(() {
      _isOpacity = !_isOpacity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: _PlaceholderWidget(isVisible: _isVisible),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _changeVisible();
            controller.animateTo(_isVisible ? kZero : 1);
          },
        ),
        body: Column(
          children: [
            ListTile(
              title: AnimatedOpacity(
                opacity: _isOpacity ? kZero : 1,
                duration: _DurationItems.durationLow,
                child: const Text('Emin'),
              ),

              //AnimatedCrossFade(
              //   firstChild: const Opacity(opacity: 1, child: Text('data')),
              //   secondChild: const Opacity(opacity: 0, child: Text('data')),
              //   crossFadeState: _isOpacity ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              //   duration: _DurationItems.durationLow,
              // ),
              trailing: IconButton(
                  onPressed: () {
                    _changeOpacity();
                  },
                  icon: const Icon(Icons.co_present_sharp)),
            ),
            AnimatedDefaultTextStyle(
              style: (_isVisible ? context.textTheme().titleMedium : context.textTheme().headlineLarge) ??
                  const TextStyle(),
              duration: _DurationItems.durationLow,
              child: const Text('data'),
            ),
            AnimatedIcon(icon: AnimatedIcons.menu_arrow, progress: controller),
            AnimatedContainer(
              duration: _DurationItems.durationLow,
              width: MediaQuery.of(context).size.height * 0.2,
              height: _isVisible ? kZero : MediaQuery.of(context).size.width * 0.2,
              color: Colors.blue,
              margin: const EdgeInsets.all(5),
              curve: Curves.easeInCirc,
            ),
            const Expanded(
                child: Stack(
              children: [AnimatedPositioned(top: 20, duration: _DurationItems.durationLow, child: Text('data'))],
            )),
            Expanded(
              child: AnimatedList(
                itemBuilder: (context, index, animation) {
                  return const Text('data');
                },
              ),
            )
          ],
        ));
  }
}

class _PlaceholderWidget extends StatelessWidget {
  const _PlaceholderWidget({
    required bool isVisible,
  }) : _isVisible = isVisible;

  final bool _isVisible;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: const Placeholder(),
      secondChild: const SizedBox.shrink(),
      duration: _DurationItems.durationLow,
      crossFadeState: _isVisible ? CrossFadeState.showSecond : CrossFadeState.showFirst,
    );
  }
}

extension BuildContextExtension on BuildContext {
  TextTheme textTheme() {
    return Theme.of(this).textTheme;
  }
}

class _DurationItems {
  static const durationLow = Duration(seconds: 1);
}
