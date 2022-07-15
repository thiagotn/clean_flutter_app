import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/widgets.dart';

import '../../data/cache/cache.dart';

class LocalStorageAdapter implements SaveSecureCacheStorage {
  final FlutterSecureStorage secureStorage;

  LocalStorageAdapter({@required this.secureStorage});

  @override
  Future<void> saveSecure({
    @required String key,
    @required String value,
  }) async {
    await secureStorage.write(key: key, value: value);
  }

  Future<void> fetchSecure(String key) async {
    await secureStorage.read(key: key);
    // final value = await secureStorage.read(key: key);
    // return value;
  }
}
