import 'package:flutter/material.dart';

class NavigateDetailDart extends StatefulWidget {
  const NavigateDetailDart({super.key, this.isOkey = false});
  final bool isOkey;
  @override
  State<NavigateDetailDart> createState() => _NavigateDetailDartState();
}

class _NavigateDetailDartState extends State<NavigateDetailDart> {
  @override
  void didChangeDependencies() {
    //ModalRoute.of(context).settings.arguments
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton.icon(
            onPressed: () {
              Navigator.of(context).pop(!widget.isOkey);
            },
            icon: Icon(Icons.check, color: widget.isOkey ? Colors.red : Colors.green),
            label: widget.isOkey ? const Text("Red") : const Text("Onayla")),
      ),
    );
  }
}
