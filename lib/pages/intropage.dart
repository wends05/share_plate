import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final isFirstDownload = SharedPreferences.getInstance()
      .then((value) => value.getBool("isFirstDownload"));

  @override
  void initState() {
    super.initState();

    isFirstDownload.then((value) {
      if (value == false) {
        GoRouter.of(context).go("/signin");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      next: const Icon(Icons.arrow_forward),
      safeAreaList: const [false, false, true, false],
      showBackButton: true,
      back: const Icon(Icons.arrow_back),
      done: const Icon(Icons.done),
      onDone: () {
        SharedPreferences.getInstance()
            .then((value) => value.setBool("isFirstDownload", false));
        GoRouter.of(context).go("/signin");
      },
      pages: [
        PageViewModel(
          title: "Welcome to Shareplate",
          body:
              "Shareplate is a platform for sharing your favorite recipes with the world.",
        ),
        PageViewModel(
            title: "Interact with the Community",
            body:
                "Allow Organizations to see your restaurant selling items you may not need anymore."),
        PageViewModel(
            title: "",
            body:
                "Allow Restaurants to see see your requests for buying their items."),
        PageViewModel(
            title: "Get Started today!",
            body: "Sign in your restaurant and get started!")
      ],
    );
  }
}
