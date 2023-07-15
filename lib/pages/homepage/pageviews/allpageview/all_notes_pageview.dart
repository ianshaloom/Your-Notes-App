import 'package:flutter/material.dart';

import 'widgets/note_tile.dart';

class AllNotesPageView extends StatefulWidget {
  const AllNotesPageView({super.key});

  @override
  State<AllNotesPageView> createState() => _AllNotesPageViewState();
}

class _AllNotesPageViewState extends State<AllNotesPageView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15),
      width: double.infinity,
      child: Stack(
        children: [
          ListView.builder(
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) => const NoteTile(),
          ),
          Positioned(
            bottom: 10,
            right: 0,
            left: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 70,
                  width: 140,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(123, 131, 131, 131),
                    borderRadius: BorderRadius.all(
                      Radius.circular(40),
                    ),
                  ),
                  child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FloatingActionButton(
                            heroTag: null,
                            elevation: 0,
                            onPressed: () {},
                            shape: const CircleBorder(),
                            backgroundColor: Colors.black,
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                          FloatingActionButton(
                            heroTag: null,
                            elevation: 0,
                            onPressed: () {},
                            shape: const CircleBorder(),
                            backgroundColor: Colors.black,
                            child: const Icon(
                              Icons.mic,
                              color: Colors.white,
                            ),
                          )
                        ],
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
