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
            child: Text(
              'save',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.green;
              }
              return Colors.blue;
            })),
          ),
          ElevatedButton(onPressed: null, child: Text('save')),
          IconButton(onPressed: null, icon: Icon(Icons.add_call)),
          FloatingActionButton(onPressed: () {}, child: Icon(Icons.add)),
          OutlinedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red),
              padding: MaterialStateProperty.all(EdgeInsets.all(10)),
            ),
            onPressed: () {},
            child: SizedBox(
              width: 200,
              child: Text('data'),
            ),
          ),
          OutlinedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.phone_bluetooth_speaker),
            label: Text('Çağrı'),
          ),
          InkWell(onTap: () {}, child: Text('custom')),
          Container(
            height: 200,
            color: Colors.white,
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
              onPressed: () {},
              child: Padding(
                padding:
                    EdgeInsets.only(top: 20, bottom: 20, left: 40, right: 40),
                child: Text(
                  'Place Bid',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ))
        ],
      ),
    );
  }
}
