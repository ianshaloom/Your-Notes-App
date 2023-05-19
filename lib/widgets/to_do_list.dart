import 'package:flutter/material.dart';
import 'package:yournotes/widgets/recent_todolist_widget.dart';

class TodoLists extends StatefulWidget {
  const TodoLists({super.key});

  @override
  State<TodoLists> createState() => _TodoListsState();
}

class _TodoListsState extends State<TodoLists> {
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
            RecentTodo(),
          ],
        ),
      ]),
    );
  }
}
