import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_full_learn/101/stack_learn.dart';

class SheetLearn extends StatefulWidget {
  const SheetLearn({super.key});

  @override
  State<SheetLearn> createState() => _SheetLearnState();
}

class _SheetLearnState extends State<SheetLearn> with ProductSheetMixin {
  Color _backgroundColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: _backgroundColor,
      body: Center(
        child: TextButton(
          onPressed: () {
            showCustomSheet(context, const StackLearn());
          },
          child: const Text("Show"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = showCustomSheet(
              context,
              Column(
                children: [
                  Image.network('https://picsum.photos/200'),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop<bool>(true);
                    },
                    child: const Text("Kapat"),
                  )
                ],
              ));
          inspect(result);
          if (result is bool) {
            setState(() {
              _backgroundColor = Colors.teal;
            });
          } else {
            setState(() {
              _backgroundColor = Colors.blueAccent;
            });
          }
        },
        child: const Icon(Icons.share),
      ),
    );
  }
}

mixin ProductSheetMixin {
  Future<T?> showCustomSheet<T>(BuildContext context, Widget child) {
    return showModalBottomSheet<T>(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      context: context,
      builder: (context) {
        return _CustomMainSheet(child: child);
      },
    );
  }
}

class _CustomMainSheet extends StatelessWidget {
  _CustomMainSheet({
    Key? key,
    required this.child,
  }) : super(key: key);
  bool netControl = false;
  Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const _BaseSheetHeader(),
            Expanded(child: child),
          ],
        ),
      ),
    );
  }
}

class _BaseSheetHeader extends StatelessWidget {
  const _BaseSheetHeader();
  final _gripHeight = 24.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _gripHeight,
      child: Stack(
        children: [
          Divider(
            color: Colors.black26,
            thickness: 3,
            indent: MediaQuery.of(context).size.width * 0.42,
            endIndent: MediaQuery.of(context).size.width * 0.42,
          ),
          Positioned(
            right: 0,
            top: 0,
            child: SizedBox(
              width: 40,
              child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop<int>(5);
                  },
                  child: const Icon(Icons.close)),
            ),
          ),
        ],
      ),
    );
  }
}
