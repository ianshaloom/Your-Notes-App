import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SummaryTile extends StatelessWidget {
  const SummaryTile({
    super.key,
    required this.icon,
    required this.numberOfItems,
    required this.tittle,
    required this.color,
  });

  final Icon icon;
  final String numberOfItems;
  final String tittle;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: color,
        boxShadow: const [
          BoxShadow(
              blurRadius: 4.0, color: Color(0x33000000), offset: Offset(0, 5))
        ],
        borderRadius: const BorderRadius.all(
          Radius.circular(30.0),
        ),
      ),
      height: 200,
      width: size.width * 0.47,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () {},
            icon: icon,
            color:
                color == const Color(0xff111111) ? Colors.white : Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              numberOfItems,
              style: GoogleFonts.rowdies(
                fontSize: 70,
                color: color == const Color(0xff111111)
                    ? Colors.white
                    : Colors.black,
              ),
            ),
          ),
          Center(
            child: Text(
              tittle,
              style: TextStyle(
                color: color == const Color(0xff111111)
                    ? Colors.white
                    : Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
