import 'package:flutter/widgets.dart';
import 'package:get/state_manager.dart';

import '../../ui/pages/pages.dart';

import '../../domain/helpers/helpers.dart';
import '../../domain/usecases/usecases.dart';

import '../protocols/protocols.dart';

class GetxLoginPresenter extends GetxController implements LoginPresenter {
  final Validation validation;
  final Authentication authentication;

  String _email;
  String _password;

  @override
  final emailError = RxString(null);
  @override
  final passwordError = RxString(null);
  @override
  final mainError = RxString(null);
  @override
  final isFormValid = false.obs;
  @override
  final isLoading = false.obs;

  GetxLoginPresenter({
    @required this.validation,
    @required this.authentication,
  });

  @override
  void validateEmail(String email) {
    _email = email;
    emailError.value = validation.validate(field: 'email', value: email);
    _validateForm();
  }

  @override
  void validatePassword(String password) {
    _password = password;
    passwordError.value =
        validation.validate(field: 'password', value: password);
    _validateForm();
  }

  void _validateForm() {
    isFormValid.value = emailError.value == null &&
        passwordError.value == null &&
        _email != null &&
        _password != null;
  }

  @override
  Future<void> auth() async {
    isLoading.value = true;
    try {
      await authentication.auth(
        AuthenticationParams(
          email: _email,
          secret: _password,
        ),
      );
    } on DomainError catch (error) {
      mainError.value = error.description;
    }
    isLoading.value = false;
  }
}
