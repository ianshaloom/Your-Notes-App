import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yournotes/pages/signup_view.dart';
import '../firebase_options.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController _email;
  late final TextEditingController _pass;

  @override
  void initState() {
    _email = TextEditingController();
    _pass = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _pass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/login_back.jpg'),
                  fit: BoxFit.cover)),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 460,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 260,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 30, right: 30),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextField(
                                  controller: _email,
                                  enableSuggestions: false,
                                  autocorrect: false,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: const InputDecoration(
                                    labelText: 'Email Address',
                                    icon: Icon(Icons.email),
                                  ),
                                ),
                                const SizedBox(height: 25),
                                TextField(
                                  controller: _pass,
                                  enableSuggestions: false,
                                  autocorrect: false,
                                  decoration: const InputDecoration(
                                      labelText: 'Password',
                                      icon: Icon(Icons.lock)),
                                  obscureText: true,
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 200,
                          height: 95,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () async {
                                  final email = _email.text;
                                  final pass = _pass.text;
                                  try {
                                    final userCredential = await FirebaseAuth
                                        .instance
                                        .signInWithEmailAndPassword(
                                            email: email, password: pass);
                                    print(userCredential);
                                  } on FirebaseAuthException catch (e) {
                                    String? errorMessage;
                                    if (e.code == 'user-not-found') {
                                      errorMessage = 'User Not Found';
                                    }
                                    if (errorMessage != null) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          backgroundColor: const Color.fromARGB(
                                              255, 151, 10, 0),
                                          content: Text(
                                            errorMessage,
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                        ),
                                      );
                                    }
                                  }
                                },
                                child: Text('Login',
                                    style: GoogleFonts.rowdies(
                                      color: Colors.black,
                                      fontSize: 35,
                                      //fontWeight: FontWeight.bold
                                    )),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () async {
                              await Navigator.of(context).pushNamedAndRemoveUntil(
                                '/signup/',
                                (route) => false,
                              );
                            },
                            child: Text(
                              'Sign Up Here !',
                              style: GoogleFonts.rowdies(
                                color: const Color.fromARGB(255, 1, 44, 73),
                                fontSize: 13,
                                //fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text('Forgot Password ?',
                                style: GoogleFonts.rowdies(
                                  letterSpacing: 1,
                                  color: const Color.fromARGB(255, 1, 44, 73),
                                  fontSize: 13,
                                  //fontWeight: FontWeight.bold
                                )),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
