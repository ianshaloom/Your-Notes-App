import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:yournotes/pages/profile_view.dart';
import 'package:yournotes/pages/utils.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final navigatorKey = GlobalKey<NavigatorState>();
  late final TextEditingController _fname;
  late final TextEditingController _email;
  late final TextEditingController _pass;
  late final TextEditingController _confirmPass;

  Color _containerColor1 = const Color.fromARGB(120, 231, 231, 231);
  Color _containerColor2 = const Color.fromARGB(120, 231, 231, 231);
  String _errorTextMessage = '';

  @override
  void initState() {
    _fname = TextEditingController();
    _email = TextEditingController();
    _pass = TextEditingController();
    _confirmPass = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    //_fname.dispose();
    _email.dispose();
    _pass.dispose();
    _confirmPass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
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
                top: 15,
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
                    controller: _fname,
                    textInputAction: TextInputAction.next,
                    style: const TextStyle(
                      fontSize: 17,
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'First Name',
                      icon: Icon(Icons.supervised_user_circle),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12.0),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 15,
                left: 10,
                right: 10,
              ),
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  color: _containerColor1,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 8, left: 15),
                  child: TextField(
                    controller: _email,
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
                          _containerColor1 =
                              const Color.fromARGB(120, 231, 231, 231);
                        } else if (!EmailValidator.validate(value)) {
                          _containerColor1 =
                              const Color.fromRGBO(248, 71, 58, 0.123);
                        } else {
                          _containerColor1 =
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
                top: 15,
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
                    controller: _pass,
                    textInputAction: TextInputAction.next,
                    enableSuggestions: false,
                    autocorrect: false,
                    obscureText: true,
                    style: const TextStyle(
                      fontSize: 17,
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'New Password',
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
                      } else if (_pass.text.trim().length < 6 &&
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
              padding: const EdgeInsets.all(0),
              child: Text(
                _errorTextMessage,
                style: const TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                left: 10,
                right: 10,
              ),
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  color: _containerColor2,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 8, left: 15),
                  child: TextField(
                    controller: _confirmPass,
                    enabled: _pass.text.isNotEmpty,
                    textInputAction: TextInputAction.done,
                    enableSuggestions: false,
                    autocorrect: false,
                    obscureText: true,
                    style: const TextStyle(
                      fontSize: 17,
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Confirm Password',
                      icon: Icon(Icons.lock),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12.0),
                    ),
                    onChanged: (value) {
                      setState(() {
                        if (value.isEmpty) {
                          _containerColor2 =
                              const Color.fromARGB(120, 231, 231, 231);
                        } else if (value != _pass.text.trim() &&
                            value.isNotEmpty) {
                          _containerColor2 =
                              const Color.fromRGBO(248, 71, 58, 0.123);
                        } else if (value == _pass.text.trim()) {
                          _containerColor2 =
                              const Color.fromARGB(28, 36, 255, 65);
                        } else {
                          _containerColor2 =
                              const Color.fromARGB(120, 231, 231, 231);
                        }
                      });
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 30, right: 30),
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
                    if (_fname.text.trim().isNotEmpty &&
                        EmailValidator.validate(_email.text.trim()) &&
                        _pass.text.trim().isNotEmpty &&
                        _pass.text.trim().length > 6 &&
                        _pass.text.trim() == _confirmPass.text.trim()) {
                      signUp();
                    } else {
                      Utils.showSnackBar(
                          context, 'Please Validate Your Credentials');
                    }
                  },
                  child: Text(
                    'Sign Up',
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

  Future signUp() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => WillPopScope(
        // Add a WillPopScope to handle back button press
        onWillPop: () async => false,
        child: Dialog(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: const Row(
              children: [
                CircularProgressIndicator(),
                SizedBox(width: 16.0),
                Text('Signing Up...'),
              ],
            ),
          ),
        ),
      ),
    );

    try {
      Profile a = Profile();
      a.setUsername = _fname.text.trim();
      final email = _email.text.trim();
      final pass = _pass.text.trim();
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );

      navigateToEmailVerification();
    } on FirebaseAuthException catch (e) {
      Navigator.of(context).pop(); // Close the dialog
      Utils.showSnackBar(context, e.code.toString());
      return;
    }

    //Navigator.of(context).pop(); // Close the dialog
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  void navigateToEmailVerification() {
    Navigator.of(context).pushReplacementNamed('/verify/');
  }
}
