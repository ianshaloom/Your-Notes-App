import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'pageviews/allpageview/all_notes_pageview.dart';
import 'pageviews/favpageview/fav_pageview.dart';
import 'pageviews/recentpageview/recent_pageview.dart';
import 'pageviews/todopageview/todo_list_pageview.dart';

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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Your Notes',
          style: GoogleFonts.shadowsIntoLightTwo(
            fontSize: 28,
            fontWeight: FontWeight.w600,
            letterSpacing: 2,
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/profile/');
            },
            icon: const Icon(Icons.menu_rounded),
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 255, 244, 236),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 0,
            child: Container(
              margin: const EdgeInsets.only(left: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SmoothPageIndicator(
                    controller: _controller,
                    count: 4,
                    effect: const WormEffect(
                      dotWidth: 12,
                      dotHeight: 12,
                      activeDotColor: Color.fromARGB(255, 244, 223, 205),
                      dotColor: Color.fromRGBO(199, 235, 179, 0.856),
                      spacing: 15,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      ' >>> $pageName',
                      style: GoogleFonts.shadowsIntoLightTwo(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            flex: 1,
            child: PageView(
              controller: _controller,
              onPageChanged: ((value) => setPageName(value)),
              children: const [
                RecentsPageView(),
                AllNotesPageView(),
                FavouritesPageView(),
                TodoListPageView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
