import 'package:flutter/material.dart';

class RecentTodo extends StatefulWidget {
  const RecentTodo({super.key});

  @override
  State<RecentTodo> createState() => _RecentTodoState();
}

class _RecentTodoState extends State<RecentTodo> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 30.0, right: 30.0, top: 20, bottom: 20),
      child: Container(
        height: 400,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 244, 223, 205),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                padding: const EdgeInsets.all(0),
                children: [
                  _todoItem(),
                  _todoItem(),
                  _todoItem(),
                  _todoItem(),
                  _todoItem(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _todoItem() {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 10, top: 15),
      child: Container(
        height: 45,
        //width: MediaQuery.of(context).size.width - 80,
        decoration: const BoxDecoration(
          color: Color.fromARGB(213, 255, 253, 253),
          borderRadius: BorderRadius.all(
            Radius.circular(40),
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Checkbox(
                value: false,
                onChanged: (value) {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
