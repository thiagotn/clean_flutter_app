import 'package:clean_flutter_app/main/factories/cache/local_storage_adapter_factory.dart';

import '../../../domain/usecases/usecases.dart';

import '../../../../data/usecases/usecases.dart';

SaveCurrentAccount makeLocalSaveCurrentAccount() {
  return LocalSaveCurrentAccount(
      saveSecureCacheStorage: makeLocalStorageAdapter());
}
