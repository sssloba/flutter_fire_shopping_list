import 'package:flutter/material.dart';

import 'package:flutter_fire_shopping_list/screens/home_page.dart';
import 'package:flutter_fire_shopping_list/services/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();

  // @override
  // void initState() {
  //   super.initState();
  //   emailTextController = TextEditingController();
  //   passwordTextController = TextEditingController();
  // }

  @override
  void dispose() {
    emailTextController.dispose();
    passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: emailTextController,
              decoration: const InputDecoration(hintText: 'Email'),
            ),
            TextFormField(
              controller: passwordTextController,
              decoration: const InputDecoration(hintText: 'Password'),
            ),
            ElevatedButton(
              onPressed: () async => await AuthService()
                  .loginWithEmail(
                      email: emailTextController.text,
                      password: passwordTextController.text)
                  .then((value) => Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          builder: (context) => const HomePage()))),
              child: const Text('Login'),
            ),
            ElevatedButton(
              onPressed: () async => await AuthService()
                  .signUpWithEmail(
                      email: emailTextController.text,
                      password: passwordTextController.text)
                  .then((value) => Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          builder: (context) => const HomePage()))),
              child: const Text('SignUp'),
            ),
          ],
        ),
      ),
    );
  }
}
