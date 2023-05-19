import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:yournotes/widgets/all_notes.dart';
import 'package:yournotes/widgets/favourites.dart';
import 'package:yournotes/widgets/recent_widget.dart';
import 'package:yournotes/widgets/to_do_list.dart';

class NotesHomePage extends StatefulWidget {
  const NotesHomePage({super.key});

  @override
  State<NotesHomePage> createState() => _NotesHomePageState();
}

class _NotesHomePageState extends State<NotesHomePage> {
  final navigatorKey = GlobalKey<NavigatorState>();
  List<String> pageNames = [
    'Recents',
    'All Notes',
    'Favourites',
    'ToDo List',
  ];
  String pageName = 'Recents';
  late int widgetIndex = 0;
  final _controller = PageController();

  // Set page name
  void setPageName(int value) {
    setState(() {
      pageName = pageNames[value];
    });
  }

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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      pageName,
                      style: GoogleFonts.shadowsIntoLightTwo(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 2,
                      ),
                    ),
                    SmoothPageIndicator(
                      controller: _controller,
                      count: 4,
                      effect: const ExpandingDotsEffect(
                        dotWidth: 20,
                        activeDotColor: Color.fromARGB(255, 244, 223, 205),
                        dotColor: Color.fromRGBO(199, 235, 179, 0.856),
                        spacing: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            flex: 1,
            child: SizedBox(
              child: PageView(
                controller: _controller,
                onPageChanged: ((value) => setPageName(value)),
                children: const [
                  Recents(),
                  AllNotes(),
                  Bookmark(),
                  TodoLists(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
