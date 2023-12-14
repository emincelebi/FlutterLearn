import 'package:flutter/material.dart';

class FormLearnView extends StatefulWidget {
  const FormLearnView({super.key});

  @override
  State<FormLearnView> createState() => _FormLearnViewState();
}

class _FormLearnViewState extends State<FormLearnView> {
  final GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _key,
        autovalidateMode: AutovalidateMode.always, //daima çalışır
        // onChanged: () {}, içerde olduğun süre boyunca daima çalışır
        child: Column(
          children: [
            TextFormField(validator: FormFieldValidator().isNotEmpty),
            TextFormField(validator: FormFieldValidator().isNotEmpty),
            DropdownButtonFormField(
              value: 'v1',
              validator: FormFieldValidator().isNotEmpty,
              items: const [
                DropdownMenuItem(value: 'v1', child: Text('DD1')),
                DropdownMenuItem(value: 'v2', child: Text('DD2')),
                DropdownMenuItem(value: 'v3', child: Text('DD3')),
              ],
              onChanged: (value) {},
            ),
            ElevatedButton(
              onPressed: () {
                if (_key.currentState?.validate() ?? false) {
                  print('okey');
                }
              },
              child: const Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}

class FormFieldValidator {
  String? isNotEmpty(String? data) {
    return (data?.isNotEmpty ?? false) ? null : ValidatorMessage._notEmpty;
  }
}

class ValidatorMessage {
  static const String _notEmpty = 'Bu alan boş geçilemez';
}
