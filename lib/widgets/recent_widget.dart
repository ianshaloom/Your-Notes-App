import 'package:flutter/material.dart';
import 'package:yournotes/widgets/recent_note_widget.dart';
import 'package:yournotes/widgets/recent_todolist_widget.dart';

class Recents extends StatefulWidget {
  const Recents({super.key});

  @override
  State<Recents> createState() => _RecentsState();
}

class _RecentsState extends State<Recents> {
  @override
  Widget build(BuildContext context) {
    return Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color.fromARGB(0, 199, 0, 0),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: Stack(children: [
                ListView(
                  padding: const EdgeInsets.all(0),
                  children: const [
                    RecentNote(),
                    RecentNote(),
                    RecentTodo(),
                  ],
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
                                  onPressed: () {},
                                  shape: const CircleBorder(),
                                  backgroundColor: Colors.black,
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                ),
                                FloatingActionButton(
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
              ]),
            );
  }
}