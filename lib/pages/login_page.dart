import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:yournotes/pages/utils.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isEmailVerified = false;
  /*  final navigatorKey = GlobalKey<NavigatorState>(); */
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Color _containerColor = const Color.fromARGB(120, 231, 231, 231);
  String _errorTextMessage = '';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color.fromARGB(0, 255, 168, 168),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 25,
                left: 10,
                right: 10,
              ),
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  color: _containerColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 8, left: 15),
                  child: TextField(
                    controller: _emailController,
                    textInputAction: TextInputAction.next,
                    enableSuggestions: false,
                    autocorrect: false,
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(
                      fontSize: 17,
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Email Address',
                      icon: Icon(Icons.email),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12.0),
                    ),
                    onChanged: (value) {
                      setState(() {
                        if (value.isEmpty) {
                          _containerColor =
                              const Color.fromARGB(120, 231, 231, 231);
                        } else if (!EmailValidator.validate(value)) {
                          _containerColor =
                              const Color.fromRGBO(248, 71, 58, 0.123);
                        } else {
                          _containerColor =
                              const Color.fromARGB(120, 231, 231, 231);
                        }
                      });
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 25,
                left: 10,
                right: 10,
              ),
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(120, 231, 231, 231),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 8, left: 15),
                  child: TextField(
                    controller: _passwordController,
                    textInputAction: TextInputAction.done,
                    enableSuggestions: false,
                    autocorrect: false,
                    obscureText: true,
                    style: const TextStyle(
                      fontSize: 17,
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Password',
                      icon: Icon(Icons.lock),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12.0),
                    ),
                    onChanged: (value) {
                      if (value.length < 6 && value.isNotEmpty) {
                        setState(() {
                          _errorTextMessage = 'Password too short';
                        });
                      } else {
                        setState(() {
                          _errorTextMessage = '';
                        });
                      }
                    },
                    onSubmitted: (String value) {
                      if (value.isEmpty) {
                        setState(() {
                          _errorTextMessage = 'Enter a valid Password';
                        });
                      } else if (_passwordController.text.trim().length < 6 &&
                          value.isNotEmpty) {
                        setState(() {
                          _errorTextMessage = 'Password too short';
                        });
                      } else {
                        setState(() {
                          _errorTextMessage = '';
                        });
                      }
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                _errorTextMessage,
                style: const TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Forgot Password? ',
                    style: GoogleFonts.montserrat(
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Reset',
                      style: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 30, left: 30, right: 30, bottom: 10),
              child: Container(
                height: 55,
                width: 300,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color.fromARGB(255, 199, 235, 179)),
                  onPressed: () {
                    if (EmailValidator.validate(_emailController.text.trim()) &&
                        _passwordController.text.trim().isNotEmpty &&
                        _passwordController.text.trim().length > 6) {
                      signIn();
                    }else {
                      Utils.showSnackBar(
                          context, 'Please Validate Your Credentials');
                    }
                  },
                  child: Text(
                    'Login Now',
                    style: GoogleFonts.montserrat(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future checkEmailVerified() async {
    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });
    if (isEmailVerified == false) {
      navigateToEmailVerification();
    }
  }

  Future signIn() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => WillPopScope(
        onWillPop: () async => false,
        child: Dialog(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: const Row(
              children: [
                CircularProgressIndicator(),
                SizedBox(width: 16.0),
                Text('Loging In...'),
              ],
            ),
          ),
        ),
      ),
    );

    try {
      final email = _emailController.text.trim();
      final pass = _passwordController.text.trim();
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: pass,
      );

      User? user = FirebaseAuth.instance.currentUser;
      if (user != null && !user.emailVerified) {
        navigateToEmailVerification();
        return; // Return here to prevent further navigation
      }

      navigateToHomePage();
    } on FirebaseAuthException catch (e) {
      Navigator.of(context).pop(); // Close the dialog
      Utils.showSnackBar(context, e.code.toString());
      return;
    }

    /* navigatorKey.currentState!.popUntil((route) => route.isFirst); */
  }

  void navigateToHomePage() {
    Navigator.of(context).pushReplacementNamed('/home/');
  }

  void navigateToEmailVerification() {
    Navigator.of(context).pushReplacementNamed('/verify/');
  }

}
