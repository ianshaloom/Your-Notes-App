import 'package:flutter/material.dart';

class RecentNote extends StatefulWidget {
  const RecentNote({super.key});

  @override
  State<RecentNote> createState() => _RecentNoteState();
}

class _RecentNoteState extends State<RecentNote> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 20),
      child: Container(
        height: 300,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          //color: Color.fromRGBO(0, 0, 0, 0.199),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        child: Stack(
          children: [
            Row(
              children: [
                Container(
                  height: 290,
                  width: MediaQuery.of(context).size.width - 60,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(0, 0),
                      end: Alignment(0, -2),
                      colors: [
                        Color.fromRGBO(199, 235, 179, 0.856),
                        Color.fromRGBO(17, 17, 17, 0.3),
                      ],
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(215),
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 2.0,
                        color: Color(0x33000000),
                        offset: Offset(1, 3),
                      )
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 30.0,
                top: 20,
                right: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FloatingActionButton(
                    elevation: 0,
                    shape: const CircleBorder(),
                    mini: true,
                    backgroundColor: Colors.black,
                    onPressed: () {},
                    child: const Icon(
                      Icons.bookmark_add_outlined,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                height: 70,
                width: 70,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 244, 236),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FloatingActionButton(
                          //isExtended: true,
                          onPressed: () {},
                          //shape: const CircleBorder(),
                          child: const Icon(
                            Icons.arrow_outward_rounded,
                            size: 32,
                          ),
                        )
                      ],
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
