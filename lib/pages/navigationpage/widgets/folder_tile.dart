import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FolderTile extends StatelessWidget {
  final String title;
  final String totalNotes;
  final String description;
  final Color tileColor;

  const FolderTile({
    super.key,
    required this.title,
    required this.totalNotes,
    required this.description,
    required this.tileColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            height: 63,
            width: 63,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: tileColor,
              boxShadow: const [
                BoxShadow(
                  blurRadius: 6.0,
                  color: Color.fromARGB(22, 0, 0, 0),
                  offset: Offset(1, 1),
                )
              ],
            ),
            child: const Center(
              child: Icon(
                Icons.folder_open_rounded,
                size: 32,
                color: Color(0xffDADADA),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      color: const Color(0xff000000),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    totalNotes,
                    style: GoogleFonts.montserrat(
                      fontSize: 10,
                      color: const Color(0xff939191),
                    ),
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  Text(
                    description,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.montserrat(
                      fontSize: 10,
                      color: const Color(0xff7D8880),
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
