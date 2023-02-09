import 'package:flutter/material.dart';
import 'package:onework/controller/auth_controller.dart';
import 'package:provider/provider.dart';

import 'confirm_page.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  late TextEditingController email;

  @override
  void initState() {
    email = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    password.dispose();
    email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextFormField(
              controller: email,
              decoration: const InputDecoration(labelText: "Email"),
            ),
            TextFormField(
              controller: password,
              decoration: const InputDecoration(labelText: "Password"),
            ),
            TextFormField(
              controller: confirmPassword,
              decoration:
                  const InputDecoration(labelText: "Password Confirmation"),
            ),
            context.watch<AuthController>().wrongPassword != null
                ? Text(context.watch<AuthController>().wrongPassword ?? "")
                : SizedBox.shrink(),
            ElevatedButton(
                onPressed: () {
                  context.read<AuthController>().signUp(
                      email: email.text,
                      password: password.text,
                      confirmPassword: confirmPassword.text,
                      onSuccess: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => ConfirmationPage(
                                  email: email.text,
                                )));
                      });
                },
                child: const Text("Sign Up"))
          ],
        ),
      ),
    );
  }
}
