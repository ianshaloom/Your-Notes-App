import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 5),
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
                  child: SizedBox(
                    height: 24,
                    width: 24,
                    child: SvgPicture.asset("assets/icons/menu.svg"),
                  ),
                ),
                Row(
                  children: [
                    GestureDetector(
                      child: SizedBox(
                        height: 20,
                        width: 20,
                        child: SvgPicture.asset("assets/icons/search.svg"),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      child: SizedBox(
                        height: 24,
                        width: 24,
                        child: SvgPicture.asset("assets/icons/grid.svg"),
                      ),
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
