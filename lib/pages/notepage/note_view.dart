import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class NotePage extends StatelessWidget {
  const NotePage({
    super.key,
    required this.noteTitle,
    required this.date,
    required this.note,
  });

  final String noteTitle;
  final DateTime date;
  final String note;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      appBar: AppBar(
        toolbarHeight: 10,
      ),
      /* appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: const Color(0xffFFFFFF),
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(
            CupertinoIcons.back,
            color: Colors.black,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.copy,
              color: Colors.black,
              size: 30,
            ) /* SvgPicture.asset(
              'assets/images/copy.svg',
              height: 25,
            ) */
            ,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Icon(
              Icons.folder_open_rounded,
              color: Colors.black,
              size: 30,
            ),
          )
        ],
        /* title: Text(
          'Notes',
          style: GoogleFonts.montserrat(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: const Color(0xff000000)),
        ), */
      ), */
      body: Stack(
        //alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Hero(
              tag: note,
              child: Card(
                elevation: 0,
                child: ListView(
                  padding: EdgeInsets.only(top: 50),
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.only(top: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            noteTitle,
                            style: GoogleFonts.montserrat(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Text(
                            DateFormat.yMMMd().format(date),
                            style: GoogleFonts.hubballi(
                              color: const Color(0xff939191),
                              fontSize: 16,
                              letterSpacing: 1.5,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        note,
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.hubballi(
                          color: const Color(0xff000000),
                          fontSize: 16,
                          height: 1.2,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 2,
                sigmaY: 2,
              ),
              child: Container(
                height: 70,
                alignment: Alignment.topCenter,
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: Icon(CupertinoIcons.back)),
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      child: Row(
                        children: [
                          GestureDetector(
                            child: SizedBox(
                              height: 24,
                              width: 24,
                              child: SvgPicture.asset("assets/icons/fav.svg"),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: GestureDetector(
                              child: SizedBox(
                                height: 24,
                                width: 24,
                                child:
                                    SvgPicture.asset("assets/icons/folder.svg"),
                              ),
                            ),
                          ),
                          GestureDetector(
                            child: SizedBox(
                              height: 24,
                              width: 24,
                              child:
                                  SvgPicture.asset("assets/icons/export.svg"),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
