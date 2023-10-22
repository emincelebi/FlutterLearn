import 'package:flutter/material.dart';

class CountText extends StatefulWidget {
  const CountText({Key? key}) : super(key: key);

  @override
  State<CountText> createState() => _CountTextState();
}

class _CountTextState extends State<CountText> {
  final TextEditingController _textController = TextEditingController();
  int _charCount = 0;

  void _updateCharCount() {
    setState(() {
      _charCount = _textController.text.length;
    });
  }

  @override
  void initState() {
    super.initState();
    _textController.addListener(_updateCharCount);
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _textController,
            decoration: const InputDecoration(labelText: "Metin Giriniz"),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              height: 100,
              child: Text("Karakter Sayisi: ${_charCount.toString()}", style: const TextStyle(fontSize: 24)),
            ),
          )
        ],
      ),
    );
  }
}
