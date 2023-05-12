import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:yournotes/firebase_options.dart';
import 'package:yournotes/pages/login_view.dart';
import 'package:yournotes/pages/routes.dart';
import 'package:yournotes/pages/verified_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Your Notes',
    theme: ThemeData(
      primarySwatch: Colors.grey,
    ),
    home: const HomePage(),
    routes: routess,
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              /* final user = FirebaseAuth.instance.currentUser;
              if (user?.emailVerified ?? false) {
                return const LoginPage();
              } else {
                return const VerifiedPage();              
              } */
              return const LoginPage(); 
            default:
              return const CircularProgressIndicator();
          }
        },
      );
  }
}


