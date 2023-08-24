import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final int totalNotes;
  final Function onTap;

  MyPersistentHeaderDelegate(this.totalNotes,
      {required this.onTap, required this.minHeight, required this.maxHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 60,
              child: Column(
                children: [
                  Text(
                    'Your Notes',
                    style: GoogleFonts.montserrat(
                      fontSize: 30,
                      color: const Color(0xff000000),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      '${totalNotes.toString()} notes',
                      style: GoogleFonts.montserrat(
                          fontSize: 15, color: const Color(0xff939191)),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => onTap(context),
                  child: const Icon(
                    Icons.menu_rounded,
                  ),
                ),
                const Row(
                  children: [
                    Icon(
                      Icons.search,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.grid_3x3,
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
