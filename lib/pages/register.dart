import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shareplate_flutter/config/firebasefunctions.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();

  final nameControl = TextEditingController();
  final emailControl = TextEditingController();
  final passwordControl = TextEditingController();
  final confirmPasswordControl = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailControl.dispose();
    passwordControl.dispose();
    confirmPasswordControl.dispose();
  }

  Widget _formField(String name, TextEditingController control) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name),
        TextFormField(
          controller: control,
          validator: (val) {
            if (val == null || val.isEmpty) {
              return "This field cannot be empty";
            }

            if (name == "Name" && val.length < 3) {
              return "Name must be at least 3 characters";
            }

            if (name == "Email" && !val.contains("@")) {
              return "Invalid email";
            }

            if (name == "Password" && val.length < 6) {
              return "Password must be at least 6 characters";
            }

            if (name == "Confirm Password" && val != passwordControl.text) {
              return "Passwords do not match";
            }

            return null;
          },
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Sign In",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Column(
              children: [
                Form(
                    key: _formKey,
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      runSpacing: 20,
                      children: [
                        _formField("Name", nameControl),
                        _formField("Email", emailControl),
                        _formField("Password", passwordControl),
                        _formField("Confirm Password", confirmPasswordControl),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: SizedBox(
                            height: 40,
                            width: 130,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  Auth()
                                      .registerUser(
                                          nameControl.text,
                                          emailControl.text,
                                          passwordControl.text)
                                      .then((value) => GoRouter.of(context)
                                          .go("/register2"));
                                }
                              },
                              child: const Row(
                                children: [
                                  Icon(Icons.arrow_forward),
                                  Text("Register")
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    )),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Text("Already have an account? "),
                  TextButton(
                      onPressed: () {
                        GoRouter.of(context).go("/signin");
                      },
                      child: const Text("Log In"))
                ]),
              ],
            )
          ],
        ),
      ),
    );
  }
}
