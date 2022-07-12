import '../../factories/factories.dart';

import '../../../domain/usecases/usecases.dart';

import '../../../../data/usecases/usecases.dart';

Authentication makeRemoteAuthentication() {
  return RemoteAuthentication(
    httpClient: makeHttpAdapter(),
    url: makeApiUrl('login'),
  );
}
