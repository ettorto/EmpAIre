import 'package:flutter/material.dart';
import 'package:food/screens/createprofile.dart';
import 'package:food/screens/editprofile.dart';
import 'package:food/screens/profile_screen.dart';
import 'package:food/widgets/layout.dart';
import 'package:go_router/go_router.dart';
import 'package:food/screens/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyB8m12gv5yzFnKaczo4kqbIleCtcTed-FQ",
          authDomain: "web-tech-final-fa4bc.firebaseapp.com",
          projectId: "web-tech-final-fa4bc",
          storageBucket: "web-tech-final-fa4bc.appspot.com",
          messagingSenderId: "816942835643",
          appId: "1:816942835643:web:d93e4ce542f39d32df469e",
          measurementId: "G-2Z8RN874ZE"));

  runApp(const ProviderScope(child: MyApp()));
}

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) =>
          Scaffold(backgroundColor: Colors.white, body: CreateProfilePage()),
    ),
    GoRoute(
      path: '/myprofile',
      builder: (context, state) =>
          Scaffold(backgroundColor: Colors.white, body: ProfileScreen()),
    ),
    GoRoute(
      path: '/edit',
      builder: (context, state) =>
          Scaffold(backgroundColor: Colors.white, body: EditProfileScreen()),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => Scaffold(backgroundColor: Colors.white,body: Layout()),
    )
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
