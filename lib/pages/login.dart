import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shareplate_flutter/config/firebasefunctions.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final emailcontrol = TextEditingController();
  final passwordcontrol = TextEditingController();

  @override
  void dispose() {
    emailcontrol.dispose();
    passwordcontrol.dispose();
    super.dispose();
  }

  Widget _formField(String name, TextEditingController control) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name),
        TextFormField(
          controller: control,
          validator: (val) {
            return (val == null || val.isEmpty)
                ? "This field cannot be empty"
                : null;
          },
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Log In",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            Form(
                key: _formKey,
                child: Wrap(
                  runSpacing: 20,
                  alignment: WrapAlignment.center,
                  children: [
                    _formField('Email', emailcontrol),
                    _formField('Password', passwordcontrol),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: SizedBox(
                          width: 130,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Auth()
                                    .signInUser(
                                        emailcontrol.text, passwordcontrol.text)
                                    .then((value) =>
                                        GoRouter.of(context).go("/register2"));
                              }
                            },
                            child: const Row(
                              children: [
                                Icon(Icons.arrow_forward_ios_outlined),
                                Text("Log In")
                              ],
                            ),
                          ),
                        )),
                  ],
                )),
            TextButton(
                onPressed: () {
                  if (kDebugMode) {
                    print("create an account");
                  }
                  GoRouter.of(context).go("/register");
                },
                child: const Text("Create an Account")),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ElevatedButton(
                onPressed: () {
                  Auth().googleLogIn().then((val) {
                    GoRouter.of(context).go("/register2");
                  });
                },
                child: const SizedBox(
                    width: 200,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.g_mobiledata_sharp),
                          Text("Log In with Google")
                        ])),
              ),
            )
          ],
        ),
      ),
    );
  }
}
