import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:clean_flutter_app/domain/helpers/helpers.dart';
import 'package:clean_flutter_app/domain/usecases/usecases.dart';

import 'package:clean_flutter_app/data/usecases/usecases.dart';
import 'package:clean_flutter_app/data/http/http.dart';

class HttpClientSpy extends Mock implements HttpClient {}

void main() {
  RemoteAuthentication sut;
  AuthenticationParams params;
  HttpClientSpy httpClient;
  String url;

  setUp(() {
    httpClient = HttpClientSpy();
    url = faker.internet.httpUrl();
    sut = RemoteAuthentication(httpClient: httpClient, url: url);
    params = AuthenticationParams(
      email: faker.internet.email(),
      secret: faker.internet.password(),
    );
  });

  test('Should call HttpClient with correct values', () async {
    final accessToken = faker.guid.guid();
    when(httpClient.request(
            url: anyNamed('url'),
            method: anyNamed('method'),
            body: anyNamed('body')))
        .thenAnswer((_) async => {
              'accessToken': accessToken,
              'name': faker.person.name(),
            });

    await sut.auth(params);

    verify(httpClient.request(url: url, method: 'post', body: {
      'email': params.email,
      'password': params.secret,
    }));
  });

  test('Should throw Unexpected if HttpClient returns 400', () async {
    when(httpClient.request(
            url: anyNamed('url'),
            method: anyNamed('method'),
            body: anyNamed('body')))
        .thenThrow(HttpError.badRequest);

    final future = sut.auth(params);

    expect(future, throwsA(DomainError.unexpected));
  });

  test('Should throw Unexpected if HttpClient returns 404', () async {
    when(httpClient.request(
            url: anyNamed('url'),
            method: anyNamed('method'),
            body: anyNamed('body')))
        .thenThrow(HttpError.notFound);

    final future = sut.auth(params);

    expect(future, throwsA(DomainError.unexpected));
  });

  test('Should throw Unexpected if HttpClient returns 500', () async {
    when(httpClient.request(
            url: anyNamed('url'),
            method: anyNamed('method'),
            body: anyNamed('body')))
        .thenThrow(HttpError.serverError);

    final future = sut.auth(params);

    expect(future, throwsA(DomainError.unexpected));
  });

  test('Should throw InvalidCredencialsError if HttpClient returns 401',
      () async {
    when(httpClient.request(
            url: anyNamed('url'),
            method: anyNamed('method'),
            body: anyNamed('body')))
        .thenThrow(HttpError.unauthorized);

    final future = sut.auth(params);

    expect(future, throwsA(DomainError.invalidCredentials));
  });

  test('Should return an Account if HttpClient returns 200', () async {
    final accessToken = faker.guid.guid();
    when(httpClient.request(
            url: anyNamed('url'),
            method: anyNamed('method'),
            body: anyNamed('body')))
        .thenAnswer((_) async => {
              'accessToken': accessToken,
              'name': faker.person.name(),
            });
    final account = await sut.auth(params);

    expect(account.token, accessToken);
  });

  test('Should throw Unexepected if HttpClient returns 200 with invalid data',
      () async {
    when(httpClient.request(
            url: anyNamed('url'),
            method: anyNamed('method'),
            body: anyNamed('body')))
        .thenAnswer((_) async => {
              'invalid_key': 'invalid_value',
            });
    final future = sut.auth(params);

    expect(future, throwsA(DomainError.unexpected));
  });
}
