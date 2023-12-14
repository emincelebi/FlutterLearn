import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureContextLearn extends StatefulWidget {
  const SecureContextLearn({super.key});

  @override
  State<SecureContextLearn> createState() => _SecureContextLearnState();
}

enum _SecureKeys { token }

//Secure Context farkı cache de uygulama silinirse data silinir securede kendin silmelisin

class _SecureContextLearnState extends State<SecureContextLearn> {
  late final storage;
  String _title = '';

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  @override
  void initState() {
    storage = FlutterSecureStorage(aOptions: _getAndroidOptions());
    readData();
    super.initState();
  }

  Future<void> readData() async {
    _title = await storage.read(key: _SecureKeys.token.name) ?? '';
    setState(() {});
  }

  void onChangedT(String data) {
    setState(() {
      _title = data;
    });
  }

  Future<void> saveData(String data) async {
    await storage.write(key: _SecureKeys.token.name, value: data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      floatingActionButton: FloatingActionButton.extended(onPressed: () => saveData(_title), label: const Text("Save")),
      body: TextField(
        onChanged: (value) {
          onChangedT(value);
        },
      ),
    );
  }
}
