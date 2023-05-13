import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotesHomePage extends StatefulWidget {
  const NotesHomePage({super.key});

  @override
  State<NotesHomePage> createState() => _NotesHomePageState();
}

class _NotesHomePageState extends State<NotesHomePage> {
  final navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 244, 236),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 0,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 175,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Stack(
                  children: [
                    Text(
                      'Your',
                      style: GoogleFonts.marcellus(
                        fontSize: 80,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 16,
                      top: 55,
                      child: Text(
                        'Notes',
                        style: GoogleFonts.marcellus(
                          fontSize: 90,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 8,
                      bottom: 90,
                      child: IconButton(
                        onPressed: () {
                          /* navigatorKey.currentState!
                              .popUntil((route) => route.isFirst); */
                          Navigator.of(context)
                              .pushReplacementNamed('/profile/');
                        },
                        icon: const Icon(Icons.menu_rounded),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            flex: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildInfoCard('All Notes'),
                _buildInfoCard('Favourites'),
                _buildInfoCard('To-Do List'),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            flex: 1,
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                color: Color.fromARGB(0, 199, 0, 0),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: ListView(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 15.0, left: 15, right: 15),
                    child: _buildRecentNote(),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 15.0, left: 15, right: 15),
                    child: _buildRecentNote(),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 15.0, left: 15, right: 15),
                    child: _buildRecentNote(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(String cardTitle) {
    return InkWell(
      onTap: () {
        selectCard(cardTitle);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          color: cardTitle == selectedCard
              ? const Color.fromRGBO(199, 235, 179, 0.8)
              : Colors.transparent,
          border: Border.all(
              color: cardTitle == selectedCard
                  ? Colors.transparent
                  : Color.fromARGB(255, 240, 134, 41).withOpacity(0.3),
              style: BorderStyle.solid,
              width: 0.75),
        ),
        height: 35.0,
        width: 130.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 15.0),
              child: Text(cardTitle,
                  style: TextStyle(
                    fontSize: 12.0,
                    color: cardTitle == selectedCard
                        ? Colors.black
                        : Colors.grey.withOpacity(0.7),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  selectCard(cardTitle) {
    setState(() {
      selectedCard = cardTitle;
    });
  }
}

Widget _buildRecentNote() {
  return SizedBox(
    child: Column(
      children: [
        Container(
          width: 400,
          height: 230,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(17, 17, 17, 0.3),
                Color.fromRGBO(199, 235, 179, 0.8),
              ],
            ),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(50.0),
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 295,
              height: 100,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(199, 235, 179, 0.8),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30.0),
                  bottomLeft: Radius.circular(30.0),
                ),
              ),
            ),
            Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(60, 170, 0, 0),
              ),
              child: Stack(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(199, 235, 179, 0.8),
                    ),
                  ),
                  Positioned(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 255, 244, 236),
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(50.0),
                          topLeft: Radius.circular(50.0),
                          topRight: Radius.circular(30.0),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    bottom: 20,
                    child: FloatingActionButton(
                      onPressed: () {},
                      child: const Icon(Icons.arrow_outward_outlined),
                    ),
                  )
                ],
              ),
            ),
          ],
        )
      ],
    ),
  );
}

//Global Members
var selectedCard = 'WEIGHT';
