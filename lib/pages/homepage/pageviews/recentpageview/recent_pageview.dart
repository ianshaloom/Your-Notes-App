import 'package:flutter/material.dart';

import 'widgets/recent_note_tile.dart';
import 'widgets/recent_todo_list_tile.dart';

class RecentsPageView extends StatefulWidget {
  const RecentsPageView({super.key});

  @override
  State<RecentsPageView> createState() => _RecentsPageViewState();
}

class _RecentsPageViewState extends State<RecentsPageView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left: 15, right: 15),
      decoration: const BoxDecoration(
        color: Color.fromARGB(0, 199, 0, 0),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      child: const Column(
        children: [
          RecentNoteTile(),
          Flexible(
            child: RecentTodoListTile(),
          ),
        ],
      ),
    );
  }
}
