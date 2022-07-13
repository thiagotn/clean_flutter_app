import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../ui/pages/pages.dart';

import '../../domain/helpers/helpers.dart';
import '../../domain/usecases/usecases.dart';

import '../protocols/protocols.dart';

class GetxLoginPresenter extends GetxController implements LoginPresenter {
  final Validation validation;
  final Authentication authentication;

  String _email;
  String _password;

  final _emailError = RxString(null);
  final _passwordError = RxString(null);
  final _mainError = RxString(null);
  final _isFormValid = false.obs;
  final _isLoading = false.obs;

  @override
  Stream<String> get emailErrorStream => _emailError.stream;
  @override
  Stream<String> get passwordErrorStream => _passwordError.stream;
  @override
  Stream<String> get mainErrorStream => _mainError.stream;
  @override
  Stream<bool> get isFormValidStream => _isFormValid.stream;
  @override
  Stream<bool> get isLoadingStream => _isLoading.stream;

  GetxLoginPresenter({
    @required this.validation,
    @required this.authentication,
  });

  @override
  void validateEmail(String email) {
    _email = email;
    _emailError.value = validation.validate(field: 'email', value: email);
    validateForm();
  }

  @override
  void validatePassword(String password) {
    _password = password;
    _passwordError.value =
        validation.validate(field: 'password', value: password);
    validateForm();
  }

  void validateForm() {
    _isFormValid.value = _emailError.value == null &&
        _passwordError.value == null &&
        _email != null &&
        _password != null;
  }

  @override
  Future<void> auth() async {
    _isLoading.value = true;
    validateForm();
    try {
      await authentication.auth(
        AuthenticationParams(
          email: _email,
          secret: _password,
        ),
      );
    } on DomainError catch (error) {
      _mainError.value = error.description;
    }
    _isLoading.value = false;
    validateForm();
  }

  @override
  void dispose() {}
}