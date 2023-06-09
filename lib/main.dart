import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:yournotes/firebase_options.dart';
import 'package:yournotes/pages/home_page.dart';
import 'package:yournotes/pages/notes_main_view.dart';
import 'package:yournotes/pages/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Your Notes',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color.fromARGB(255, 255, 213, 248),
      ),
      useMaterial3: true,
    ),
    home: const NotesHomePage(),
    routes: routess,
  ));
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        final user = FirebaseAuth.instance.currentUser;
        if (snapshot.hasData) {
          print(user);
          return const NotesHomePage();
        } else {
          print(user);
          return const HomePage();
        }
      },
    );
  }
}

//Global Members
late BuildContext appContext;


    /* return FutureBuilder(
      future: Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            final user = FirebaseAuth.instance.currentUser;
            if (user != null) {
              if (user.emailVerified) {
                return const NotesHomePage();
              } else {
                return const VerifiedPage();
              }
            } else {
              return const LoginPage();
            }
            
          default:
            return const CircularProgressIndicator();
        }
      },
    ); */