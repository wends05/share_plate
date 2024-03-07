import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shareplate_flutter/config/firebasefunctions.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({super.key});

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Center(
            child: Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        children: [
          const DrawerHeader(child: Icon(Icons.home)),
          ListTile(
            title: const Text("Home"),
            leading: const Icon(Icons.house),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Find Restaurants"),
            leading: const Icon(Icons.restaurant),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Messages"),
            leading: const Icon(Icons.message),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Settings"),
            leading: const Icon(Icons.settings),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Logout"),
            leading: const Icon(Icons.logout),
            onTap: () async {
              await Auth().signOut().then((val) {
                GoRouter.of(context).go("/signin");
              });
            },
          ),
        ],
      ),
    )));
  }
}
