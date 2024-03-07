// Register the restaurant or organization that they want to apply to.

import 'package:flutter/material.dart';

class Register2 extends StatefulWidget {
  const Register2({super.key});

  @override
  State<Register2> createState() => _Register2State();
}

class _Register2State extends State<Register2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        appBar: AppBar(
          title: const Text("Apply to your restaurant or Organization"),
        ),
        body: const Center(child: Column(children: [Text("Start of Column")],),),
      ),
    );
  }
}
