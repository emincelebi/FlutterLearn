import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/cache/shared_manager.dart';
import 'package:flutter_full_learn/202/cache/user_model.dart';

class SharedLearn extends StatefulWidget {
  const SharedLearn({super.key});

  @override
  State<SharedLearn> createState() => _SharedLearnState();
}

class _SharedLearnState extends LoadingStatefull<SharedLearn> {
  int _currentValue = 0;
  late final SharedManager _manager;
  late final List<User> userItems;

  void _onChangeValue(String value) {
    final value0 = int.tryParse(value);

    if (value0 != null) {
      setState(() {
        _currentValue = value0;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    userItems = UserItems().users;
    _manager = SharedManager();
    _initilaze();
  }

  Future<void> _initilaze() async {
    changeLoading();
    await _manager.init();
    changeLoading();
    getDefaultValues();
  }

  Future<void> getDefaultValues() async {
    _onChangeValue(_manager.getString(SharedKeys.counter) ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_currentValue.toString()),
        actions: [
          isLoading
              ? Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [_saveValueButton(), _removeValueButton()],
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (value) {
              _onChangeValue(value);
            },
          ),
        ],
      ),
    );
  }

  FloatingActionButton _saveValueButton() {
    return FloatingActionButton(
      onPressed: () async {
        changeLoading();
        await _manager.saveString(SharedKeys.counter, _currentValue.toString());
        changeLoading();
      },
      child: const Icon(Icons.save),
    );
  }

  FloatingActionButton _removeValueButton() {
    return FloatingActionButton(
      child: const Icon(Icons.remove),
      onPressed: () async {
        changeLoading();
        await _manager.remove(SharedKeys.counter);
        changeLoading();
      },
    );
  }
}


class UserItems {
  late final List<User> users;

  UserItems() {
    users = [
      User('e', 's', 'youtube.com'),
      User('e1', 's1', 'youtube.com'),
      User('e2', 's2', 'youtube.com'),
    ];
  }
}

//Generic
abstract class LoadingStatefull<T extends StatefulWidget> extends State<T> {
  bool isLoading = false;

  void changeLoading() {
    if(mounted){
      setState(() {
      isLoading = !isLoading;
    });
    }
    
  }
}
