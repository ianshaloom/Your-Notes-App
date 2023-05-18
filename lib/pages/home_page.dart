import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yournotes/pages/signup_page.dart';

import 'login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showLoginPage = true;

  void setSignupPage() {
    setState(() {
      showLoginPage = false;
      //showPage(showLoginPage);
    });
  }

  void setLoginPage() {
    setState(() {
      showLoginPage = true;
      //showPage(showLoginPage);
    });
  }

  @override
  Widget build(BuildContext context) {
    //SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    //SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive, overlays: []);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 244, 236),
      /* appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 244, 236),
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.only(left: 15),
          child: Icon(
            Icons.nights_stay,
            color: Colors.black,
            size: 55,
          ),
        ), // Set elevation to 0
      ), */
      body: Stack(fit: StackFit.expand, children: [
        Positioned(
          top: 50,
          right: 10,
          child: Padding(
            padding: const EdgeInsets.only(left: 0),
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(3.14159), // Rotate by 180 degrees
              child: const Icon(
                Icons.nights_stay,
                color: Colors.black,
                size: 55,
              ),
            ),
          ),
        ),
        ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            /* const SizedBox(
              height: 150,
              //child: CustomPaint(painter: BackgroundPainter()),
            ), */

            SizedBox(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset(showLoginPage ? 0.0 : 0.0, -8.0),
                      end: const Offset(0.0, 0),
                    ).animate(animation),
                    child: child,
                  );
                },
                child: showLoginPage ? _buildPad1() : _buildPad2(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () {
                      setLoginPage();
                    },
                    child: Text(
                      'I Am An Old User /',
                      style: GoogleFonts.montserrat(
                        color: showLoginPage
                            ? Colors.black
                            : Colors.grey.withOpacity(0.7),
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setSignupPage();
                    },
                    child: Text(
                      'Create New',
                      style: GoogleFonts.montserrat(
                        color: !showLoginPage
                            ? Colors.black
                            : Colors.grey.withOpacity(0.7),
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //----------------------------->>>>>>>
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(showLoginPage ? 0.0 : 0.0, 8.0),
                    end: const Offset(0.0, 0),
                  ).animate(animation),
                  child: child,
                );
              },
              child: showLoginPage ? const LoginPage() : const SignupPage(),
            ),
          ],
        ),
      ]),
    );
  }

  Widget _buildPad1() {
    return Padding(
      padding: const EdgeInsets.only(top: 150, right: 150),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hey',
            style: GoogleFonts.marcellus(
              fontSize: 80,
            ),
          ),
          Text(
            'Login Now !',
            style: GoogleFonts.marcellus(
              fontSize: 40,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPad2() {
    return Padding(
      padding: const EdgeInsets.only(top: 150, right: 120),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Glad',
            style: GoogleFonts.marcellus(
              fontSize: 80,
            ),
          ),
          Text(
            'You Are Joining Us',
            style: GoogleFonts.marcellus(
              fontSize: 30,
            ),
          ),
        ],
      ),
    );
  }

/*   Future<void> showPage(bool a) async {
    if (showLoginPage) {
      AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(2.0, 1.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
        child: const LoginPage(),
      );
    } else if (!showLoginPage) {
      AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
        child: const SignupPage(),
      );
    }
  } */
}
