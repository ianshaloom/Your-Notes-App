import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      appBar: AppBar(
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
      ),
      body: Hero(
        tag: note,
        child: Card(
          elevation: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    note,
                    maxLines: 4,
                    style: GoogleFonts.hubballi(
                      color: const Color(0xff000000),
                      fontSize: 16,
                      height: 1.2,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
