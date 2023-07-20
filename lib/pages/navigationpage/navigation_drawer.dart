import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/folders.dart';
import '../../widgets/disable_list_glow.dart';
import '../bottomsheets/confirm_signout.dart';
import 'widgets/folder_tile.dart';

class NavigationnDrawer extends StatefulWidget {
  const NavigationnDrawer({super.key});

  @override
  State<NavigationnDrawer> createState() => _NavigationnDrawerState();
}

class _NavigationnDrawerState extends State<NavigationnDrawer> {
  @override
  Widget build(BuildContext context) => Drawer(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Column(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsetsDirectional.only(top: 70),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                  ),
                  color: Color(0xffFFFFFF),
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: TextButton(
                        onPressed: _confirmExit,
                        /* () {
                          //Navigator.of(context).pop();
                          _confirmExit;
                        }, */
                        child: Text(
                          'Sign Out',
                          style: GoogleFonts.montserrat(
                            fontSize: 15,
                            color: const Color(0xff000000),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Card(
                            color: Colors.white,
                            elevation: 1,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/trash.svg',
                                    height: 25,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Trash',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 15,
                                      color: const Color(0xff000000),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    '02',
                                    style: GoogleFonts.montserrat(
                                        fontSize: 14,
                                        color: const Color(0xff939191)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Card(
                            color: Colors.white,
                            elevation: 1,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              side: const BorderSide(
                                color: Color(0XFF7D91FA),
                                width: 1,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/notes.svg',
                                    height: 25,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Notes',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 15,
                                      color: const Color(0xff000000),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    '10',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                      color: const Color(0xff939191),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 20),
                          child: Text(
                            'My Folders',
                            style: GoogleFonts.montserrat(
                              fontSize: 17,
                              color: const Color(0xff000000),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 10,
                    ),
                    MaterialButton(
                      color: Theme.of(context).primaryColor,
                      elevation: 0,
                      minWidth: 250,
                      height: 45,
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      child: Text(
                        'Manage Folders',
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          color: const Color(0xff000000),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: GlowingOverscrollWrapper(
                        child: ListView(
                          padding: const EdgeInsets.all(0),
                          children: [
                            ...folders
                                .map((e) => FolderTile(
                                    title: e.title,
                                    totalNotes: e.totalNotes,
                                    description: e.description,
                                    tileColor: e.color))
                                .toList(),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );

  Future _confirmExit() async {
    Navigator.of(context).pop();
    showModalBottomSheet(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      context: context,
      builder: (context) => SignOutBottomSheet(
        onPressed: () {
          FirebaseAuth.instance.signOut();
          Navigator.pushNamedAndRemoveUntil(
            context,
            '/auth/',
            (route) => false,
          );
        },
      ),
    );
  }

  final List<Folders> folders = [
    Folders(
      title: 'Songs',
      totalNotes: "00",
      description: 'Latest releases, Mash-Ups and Remixes',
      color: const Color(0xffFFFFFF),
    ),
    Folders(
        title: 'Recipes',
        totalNotes: "10",
        description: 'Fast food preparations recipes for school',
        color: const Color(0xffF06668)),
    Folders(
      title: 'Class Notes',
      totalNotes: "35",
      description: 'This semester quick class notes and snaps',
      color: const Color(0xff34A853),
    ),
    Folders(
      title: 'Git Pull Request',
      totalNotes: "05",
      description: 'Project pull request and code reviews',
      color: const Color(0xffA5B3FF),
    ),
    Folders(
      title: 'Passwords',
      totalNotes: "15",
      description: 'Spotify, Facebook, Instagram, LinkedIn',
      color: const Color(0xffFBBC05),
    ),
  ];
}
