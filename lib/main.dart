import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'pages/authpage/auth_page.dart';
import 'pages/noteshomepage/notes_home_page.dart';
import 'utils/routes.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      //options: DefaultFirebaseOptions.currentPlatform,
      );
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Your Notes',
      theme: ThemeData(
        primaryColor: const Color(0xff7D91FA),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff7D91FA),
        ),
        useMaterial3: true,

        // Scaffold
        scaffoldBackgroundColor: const Color(0xffFFFFFF),
        
        // AppBar
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xffFFFFFF),
          centerTitle: true,
          elevation: 0,
          scrolledUnderElevation: 0,
          
        ),
        
        // Text
        textTheme: TextTheme(
          labelSmall: GoogleFonts.montserrat(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
        
        // Bottom Sheet Theme
        bottomSheetTheme: const BottomSheetThemeData(
          modalElevation: 1,
          modalBackgroundColor: Color.fromARGB(255, 255, 213, 248),
          modalBarrierColor: Color.fromARGB(123, 44, 49, 64),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20.0),
            ),
            side: BorderSide(
              color: Color.fromARGB(255, 199, 235, 179),
            ),
          ),
        ),
        
        //Card
        cardTheme: CardTheme(
          elevation: 1,
          shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            color: const Color(0xffFFFFFF),
        ),
        
        // Container
        
        
      ),
      home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const NotesHomePage();
            } else {
              return const AuthPage();
            }
          }),
      routes: routess,
    ),
  );
}

/* class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const NotesHomePage();
        } else {
          return const AuthPage();
        }
      },
    );
  }
}

//Global Members
late BuildContext appContext; */


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