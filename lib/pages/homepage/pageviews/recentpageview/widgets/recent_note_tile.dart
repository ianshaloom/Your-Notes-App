import 'package:flutter/material.dart';

class RecentNoteTile extends StatelessWidget {
  const RecentNoteTile({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: 230,
      width: MediaQuery.of(context).size.width,
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
                    bottomRight: Radius.circular(190),
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
                  Icons.favorite_border_outlined,
                  size: 30,
                  color: Color.fromARGB(255, 250, 204, 170),
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
                        heroTag: null,
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
    );
  }
}
