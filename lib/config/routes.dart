import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:shareplate_flutter/config/firebasefunctions.dart';
import 'package:shareplate_flutter/pages/home/home.dart';
import 'package:shareplate_flutter/pages/intropage.dart';
import 'package:shareplate_flutter/pages/register.dart';
import 'package:shareplate_flutter/pages/login.dart';
import 'package:shareplate_flutter/pages/register2.dart';

final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: "/",
        builder: (context, state) => const IntroPage(),
      ),
      GoRoute(path: "/signin", builder: (context, state) => const LoginPage()),
      GoRoute(path: "/register", builder: (context, state) => const Register()),
      GoRoute(
          path: "/register2",
          builder: (context, state) => const Register2(),
          redirect: (context, state) async {
            final user = await Auth().getUserDetails();

            if (kDebugMode) {
              print(user);
            }
            
            

            return null;
          }),
      GoRoute(
          path: "/home",
          builder: (context, state) => const Home(),
          redirect: (context, state) {
            if (Auth().auth.currentUser == null) {
              return "/signin";
            }

            return null;
          }),
    ],
    redirect: (context, state) {
      if (Auth().auth.currentUser == null) {
        if (state.matchedLocation == "/home") {
          return "/signin";
        }
      }

      if (Auth().auth.currentUser != null) {
        if (state.matchedLocation == "/signin" ||
            state.matchedLocation == "/register") {
          return "/home";
        }
      }

      return null;
    });
