import 'package:flutter/material.dart';

class AlertLearn extends StatefulWidget {
  const AlertLearn({super.key});

  @override
  State<AlertLearn> createState() => _AlertLearnState();
}

class _AlertLearnState extends State<AlertLearn> {
  String titleDialog = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titleDialog),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // showAboutDialog(
          //   context: context,
          //   applicationName: 'EC',
          //   applicationIcon: const Icon(Icons.pages),
          //   applicationVersion: '5',
          //   applicationLegalese: '1967',
          //   children: [const Text('data'), const Text('TS'), const Text('1967')],
          // );

          final response = await showDialog(
            context: context,
            barrierDismissible: true,
            builder: (context) {
              return const ImageZoomDialog();
            },
          );
          if (response is bool) {
            setState(() {
              titleDialog = "Starting update";
            });
          } else if (response is int) {
            setState(() {
              titleDialog = "Closed";
            });
          } else {
            setState(() {
              titleDialog = "Closed 2";
            });
          }
        },
      ),
    );
  }
}

class _UpdateDialog extends StatelessWidget {
  const _UpdateDialog();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Version update!'),
      actions: [
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            child: const Text('Update')),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop<int>(5);
          },
          child: const Text('Close'),
        )
      ],
    );
  }
}

class Keys {
  static const String versionUpdate = "Version update";
}

class UpdateDialog extends AlertDialog {
  UpdateDialog({Key? key, required BuildContext context})
      : super(
          key: key,
          title: const Text(Keys.versionUpdate),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: const Text('Update')),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop<int>(5);
              },
              child: const Text('Close'),
            )
          ],
        );
}

class ImageZoomDialog extends StatelessWidget {
  const ImageZoomDialog({super.key});

  final String _url = 'https://picsum.photos/200';

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      child: SizedBox(
          child: InteractiveViewer(
        child: Image.network(
          _url,
          fit: BoxFit.cover,
          height: 400,
        ),
      )),
    );
  }
}
