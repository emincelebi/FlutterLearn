import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/oop_learn.dart';

class OOPLearnView extends StatefulWidget {
  const OOPLearnView({super.key});

  @override
  State<OOPLearnView> createState() => _OOPLearnViewState();
}

class _OOPLearnViewState extends State<OOPLearnView> {
  FileDownload? downloadManager;

  @override
  void initState() {
    super.initState();
    downloadManager = FileDownload();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          downloadManager?.downloadItem(null);
        },
      ),
    );
  }
}
