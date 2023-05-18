import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yournotes/widgets/all_notes.dart';
import 'package:yournotes/widgets/bookmark.dart';
import 'package:yournotes/widgets/recent_widget.dart';
import 'package:yournotes/widgets/to_do_list.dart';

class NotesHomePage extends StatefulWidget {
  const NotesHomePage({super.key});

  @override
  State<NotesHomePage> createState() => _NotesHomePageState();
}

class _NotesHomePageState extends State<NotesHomePage> {
  final navigatorKey = GlobalKey<NavigatorState>();
  List<Widget> widgets = [
    const Recents(),
    const AllNotes(),
    const Bookmark(),
    const TodoLists()
  ];
  late int widgetIndex = 0;
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
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: SizedBox(
                height: 30,
                child: ListView(
                  padding: const EdgeInsets.all(0),
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildInfoCard('Recents', 0),
                    const SizedBox(width: 10.0),
                    _buildInfoCard('All Notes', 1),
                    const SizedBox(width: 10.0),
                    _buildInfoCard('Bookmarks', 2),
                    const SizedBox(width: 10.0),
                    _buildInfoCard('To-Do List', 3),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            flex: 1,
            child: widgets[widgetIndex],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(String cardTitle, int i) {
    return InkWell(
      onTap: () {
        selectCard(cardTitle, i);
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
                  ? const Color.fromARGB(204, 0, 0, 0)
                  : const Color.fromARGB(255, 230, 114, 13).withOpacity(0.5),
              style: BorderStyle.solid,
              width: 0.75),
        ),
        height: 30.0,
        width: 120.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 3.0, left: 15.0),
              child: Text(
                cardTitle,
                style: TextStyle(
                  fontSize: 16.0,
                  color: cardTitle == selectedCard
                      ? Colors.black
                      : Colors.grey.withOpacity(0.7),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  selectCard(cardTitle, i) {
    setState(() {
      selectedCard = cardTitle;
      widgetIndex = i;
    });
  }
}

//Global Members
var selectedCard = 'WEIGHT';
