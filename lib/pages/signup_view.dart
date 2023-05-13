import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../firebase_options.dart';
import 'package:yournotes/pages/login_view.dart';
import 'Utils';

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

  // Create a getter to get the enabled status of the TextButton
  bool get isSignUpButtonEnabled => arePasswordsMatching();
  bool arePasswordsMatching() {
    String password = _pass.text.trim();
    String confirmPassword = _confirmPass.text.trim();

    return password == confirmPassword;
  }

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
    _fname.dispose();
    _email.dispose();
    _pass.dispose();
    _confirmPass.dispose();
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
                  image: AssetImage('assets/images/signup_back.jpg'),
                  fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 650,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width - 40,
                            height: 390,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 7,
                                  color: Color(0x33000000),
                                  offset: Offset(5, 5),
                                  spreadRadius: 1.5,
                                )
                              ],
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 30, right: 30),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  TextField(
                                    controller: _fname,
                                    decoration: const InputDecoration(
                                      labelText: 'First Name',
                                      icon: Icon(Icons.person),
                                    ),
                                  ),
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
                                  TextField(
                                    controller: _pass,
                                    enableSuggestions: false,
                                    autocorrect: false,
                                    decoration: const InputDecoration(
                                      labelText: 'New Password',
                                      icon: Icon(Icons.lock),
                                    ),
                                    obscureText: true,
                                    onChanged: (value) {
                                      setState(
                                          () {}); // Update the state when the password field changes
                                    },
                                  ),
                                  TextField(
                                    controller: _confirmPass,
                                    enableSuggestions: false,
                                    autocorrect: false,
                                    decoration: const InputDecoration(
                                      labelText: 'Confirm Password',
                                      icon: Icon(Icons.lock),
                                    ),
                                    obscureText: true,
                                    onChanged: (value) {
                                      setState(
                                          () {}); // Update the state when the confirm password field changes
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 230,
                          height: 120,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed:
                                    isSignUpButtonEnabled ? signUp : null,
                                child: Text(
                                  'Register',
                                  style: GoogleFonts.rowdies(
                                    color: Colors.black,
                                    fontSize: 35,
                                    //fontWeight: FontWeight.bold
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 120,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () async {
                              await Navigator.of(context)
                                  .pushNamedAndRemoveUntil(
                                '/login/',
                                (route) => false,
                              );
                            },
                            child: Text('Already registered ? Login Here',
                                style: GoogleFonts.rowdies(
                                  color: const Color.fromARGB(255, 1, 44, 73),
                                  fontSize: 13,
                                  //fontWeight: FontWeight.bold
                                )),
                          ),
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
            child: Row(
              children: const [
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
