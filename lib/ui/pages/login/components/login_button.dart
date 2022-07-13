import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../login_presenter.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final presenter = Get.find<LoginPresenter>();
    return Obx(
      () => TextButton(
        onPressed: presenter.isFormValid?.value == true ? presenter.auth : null,
        child: Text(
          'Entrar'.toUpperCase(),
        ),
      ),
    );
  }
}
