import 'package:flutter_test/flutter_test.dart';

import 'package:clean_flutter_app/validation/validators/validators.dart';

import 'package:clean_flutter_app/main/factories/factories.dart';

void main() {
  test('Should return the correct validations', () {
    var validations = makeLoginValidations();
    expect(validations, const [
      RequiredFieldValidation('email'),
      EmailValidation('email'),
      RequiredFieldValidation('password')
    ]);
  });
}
