import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shareplate_flutter/components/drawer.dart';
import 'package:shareplate_flutter/config/firebasefunctions.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final user = Auth().auth.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: true,
        actions: [
          IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                Auth()
                    .signOut()
                    .then((value) => GoRouter.of(context).go('/signin'));
              })
        ],
      ),
      drawer: const HomeDrawer(),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome Home, ${user?.displayName}!"),
          ],
        ),
      ),
    );
  }
}
