import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../models/note.dart';
import '../../notepage/note_view.dart';

class NoteTile extends StatelessWidget {
  final String title;
  final DateTime date;
  final String note;
  final Function openNote;
  final Note e;

  const NoteTile(
      {super.key,
      required this.title,
      required this.date,
      required this.note,
      required this.openNote,
      required this.e});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => openNote(context, e),
      onDoubleTap: () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  NotePage(noteTitle: e.title, date: e.date, note: e.note),
            ),
            (route) => route.isFirst);
      },
      child: Hero(
        tag: note,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          color: const Color(0xffFFFFFF),
          elevation: 2,
          child: SizedBox(
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
                        title,
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
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
                          fontSize: 14,
                          letterSpacing: 1.5,
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 3, right: 8, left: 8),
                    child: Text(
                      note,
                      maxLines: 4,
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.hubballi(
                        color: const Color(0xff000000),
                        fontSize: 14,
                        height: 1.2,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
