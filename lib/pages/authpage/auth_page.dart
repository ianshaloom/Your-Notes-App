import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widgets/login_widget.dart';
import 'widgets/signup_widget.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final PageController _pageController = PageController();
  bool showLoginPage = true;
  int _pageIndex = 0;

  void _setLoginPage() {
    setState(() {
      _pageController.animateToPage(
        0,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    });
  }

  void _setSignupPage() {
    setState(() {
      _pageController.animateToPage(
        1,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    });
  }

  void newPageIndex(int value) {
    setState(() {
      _pageIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Container(
              margin: const EdgeInsets.only(left: 20),
              height: 180,
              child: _pageIndex == 0 ? _buildPad1() : _buildPad2(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () {
                      _setLoginPage();
                    },
                    child: Text(
                      'I Am An Old User /',
                      style: GoogleFonts.montserrat(
                        color: _pageIndex == 0
                            ? Colors.black
                            : Colors.grey.withOpacity(0.7),
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      _setSignupPage();
                    },
                    child: Text(
                      "I'm New Here",
                      style: GoogleFonts.montserrat(
                        color: _pageIndex == 1
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
            SizedBox(
              height: 400,
              child: PageView(
                controller: _pageController,
                onPageChanged: (value) => newPageIndex(value),
                children: const [
                  LoginWidget(),
                  SignupWidget(),
                ],
              ),
            )
          ],
        ),
      ]),
    );
  }

  Widget _buildPad1() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 50,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hey',
                style: GoogleFonts.marcellus(
                  fontSize: 60,
                ),
              ),
              Text(
                'Login Here Now',
                style: GoogleFonts.marcellus(
                  fontSize: 30,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPad2() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 50,
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Glad',
                style: GoogleFonts.marcellus(
                  fontSize: 60,
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
        ],
      ),
    );
  }
}
