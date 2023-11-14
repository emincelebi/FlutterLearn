import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/service/post_model.dart';

class ServicePostLearn extends StatefulWidget {
  const ServicePostLearn({super.key});

  @override
  State<ServicePostLearn> createState() => _ServiceLearnState();
}

class _ServiceLearnState extends State<ServicePostLearn> {
  String? name;
  bool _isLoading = false;
  late final Dio _networkManager;
  final _baseUrl = "https://jsonplaceholder.typicode.com/";

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  final TextEditingController _userIdController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _networkManager = Dio(BaseOptions(baseUrl: _baseUrl));
  }

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  // Future<void> _addItemToService(PostModel postModel) async {
  //   _changeLoading();
  //   final response = await _networkManager.post("posts", data: postModel);

  //   if (response.statusCode == 201) {
  //     setState(() {
  //       name = "Basarili";
  //     });
  //   }
  //   _changeLoading();
  // }

  Future<void> _addItemToService(PostModel postModel) async {
    _changeLoading();
    final response = await _networkManager.post("posts", data: postModel.toJson());

    if (response.statusCode == HttpStatus.created) {
      setState(() {
        name = "Basarili";
      });
    }
    _changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name ?? ""),
        actions: [_isLoading ? const CircularProgressIndicator.adaptive() : const SizedBox.shrink()],
      ),
      body: Column(
        children: [
          TextField(
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              controller: _titleController,
              decoration: const InputDecoration(labelText: "Title")),
          TextField(
              controller: _bodyController,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(labelText: "Body")),
          TextField(
              controller: _userIdController,
              keyboardType: TextInputType.number,
              autofillHints: const [AutofillHints.creditCardNumber],
              decoration: const InputDecoration(labelText: "User ID")),
          TextButton(
              onPressed: _isLoading
                  ? null
                  : () {
                      if (_titleController.text.isNotEmpty &&
                          _bodyController.text.isNotEmpty &&
                          _userIdController.text.isNotEmpty) {
                        final model = PostModel(
                            title: _titleController.text,
                            body: _bodyController.text,
                            userId: int.tryParse(_userIdController.text));
                        _addItemToService(model);
                      }
                    },
              child: const Text("Send")),
        ],
      ),
    );
  }
}

class _PostCard extends StatelessWidget {
  const _PostCard({
    Key? key,
    required PostModel? model,
  })  : _model = model,
        super(key: key);

  final PostModel? _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        title: Text(_model?.title ?? ""),
        subtitle: Text(_model?.body ?? ""),
      ),
    );
  }
}
