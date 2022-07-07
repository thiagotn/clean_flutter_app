import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Image(
              image: AssetImage('lib/ui/assets/logo.png'),
            ),
            Text('Login'.toUpperCase()),
            Form(
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      icon: Icon(
                        Icons.email,
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      icon: Icon(
                        Icons.lock,
                      ),
                    ),
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Entrar'.toUpperCase(),
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    label: const Text(
                      'Criar Conta',
                    ),
                    icon: const Icon(Icons.person),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
