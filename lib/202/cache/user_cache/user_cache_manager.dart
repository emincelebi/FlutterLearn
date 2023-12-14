import 'dart:convert';

import 'package:flutter_full_learn/202/cache/shared_manager.dart';
import 'package:flutter_full_learn/202/cache/user_model.dart';

import '../shared_learn_cache.dart';

class UserCacheManager {
  final SharedManager sharedManager;

  UserCacheManager(this.sharedManager);

  Future<void> saveItems(List<User> items) async {
    //Compute
    final items0 = items.map((e) => jsonEncode(e.toJson())).toList();
    await sharedManager.saveStringItems(SharedKeys.users, items0);
  }

  List<User>? getItems() {
    //Compute
    final itemsString = sharedManager.getStrings(SharedKeys.users);
    if (itemsString?.isNotEmpty ?? false) {
      return itemsString!.map((e) {
        final json = jsonDecode(e);
        if (json is Map<String, dynamic>) {
          return User.fromJson(json);
        }
        return User('name', 'description', 'url');
      }).toList();
    }
    return null;
  }
}
