import 'package:flutter/material.dart';

class ButtonLearn extends StatelessWidget {
  const ButtonLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextButton(
            onPressed: () {},
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.green;
              }
              return Colors.blue;
            })),
            child: Text(
              'save',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          const ElevatedButton(onPressed: null, child: Text('save')),
          const IconButton(onPressed: null, icon: Icon(Icons.add_call)),
          FloatingActionButton(onPressed: () {}, child: const Icon(Icons.add)),
          OutlinedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red),
              padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
            ),
            onPressed: () {},
            child: const SizedBox(
              width: 200,
              child: Text('data'),
            ),
          ),
          OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.phone_bluetooth_speaker),
            label: const Text('Çağrı'),
          ),
          InkWell(onTap: () {}, child: const Text('custom')),
          Container(
            height: 200,
            color: Colors.white,
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
              onPressed: () {},
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 20, bottom: 20, left: 40, right: 40),
                child: Text(
                  'Place Bid',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ))
        ],
      ),
    );
  }
}
