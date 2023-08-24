import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:yournotes/models/note.dart';

class NoteDialog extends StatelessWidget {
  final Note e;
  const NoteDialog({super.key, required this.e});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 100, bottom: 70),
      child: Card(
        elevation: 0,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Hero(
          tag: e.note,
          child: Card(
            elevation: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10, top: 10),
                  height: 8,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffD9E8FC),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(top: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        e.title,
                        style: GoogleFonts.montserrat(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        DateFormat.yMMMd().format(e.date),
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    child: SingleChildScrollView(
                      child: Text(
                        e.note,
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.hubballi(
                          color: const Color(0xff000000),
                          fontSize: 16,
                          height: 1.2,
                        ),
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
