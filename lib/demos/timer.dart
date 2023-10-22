import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CountdownApp(),
    );
  }
}

class CountdownApp extends StatefulWidget {
  @override
  _CountdownAppState createState() => _CountdownAppState();
}

class _CountdownAppState extends State<CountdownApp> {
  final TextEditingController _textController = TextEditingController();
  int _countdown = 0;
  late Timer _timer;

  void _startCountdown() {
    int? seconds = int.tryParse(_textController.text);
    if (seconds! > 0) {
      setState(() {
        _countdown = seconds;
      });

      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          if (_countdown > 0) {
            _countdown--;
          } else {
            _timer.cancel();
          }
        });
      });
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    if (_timer.isActive) {
      _timer.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Zamanlayıcı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _textController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Başlangıç Süresi (saniye)",
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Geri Sayım: $_countdown saniye",
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _startCountdown,
              child: const Text("Başlat"),
            ),
          ],
        ),
      ),
    );
  }
}
