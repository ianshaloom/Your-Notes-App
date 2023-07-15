import 'package:flutter/material.dart';

class NoteTile extends StatelessWidget {
  const NoteTile({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SizedBox(
        height: 230,
        width: size.width,
        child: Stack(
          children: [
            Row(
              children: [
                Container(
                  height: 230,
                  width: size.width * 0.85,
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
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(180),
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
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
              padding: EdgeInsets.only(right: size.width * 0.15, top: 20),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.delete_outline_outlined,
                    size: 30,
                    color: Colors.black,
                  ),
                  SizedBox(width: 10),
                  Icon(
                    Icons.favorite_outline_sharp,
                    size: 30,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                height: 60,
                width: 60,
                padding: const EdgeInsets.all(7),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 244, 236),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: FloatingActionButton(
                  heroTag: null,
                  elevation: 0,
                  onPressed: () {},
                  mini: true,
                  child: const Icon(
                    Icons.arrow_outward_rounded,
                    size: 32,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
