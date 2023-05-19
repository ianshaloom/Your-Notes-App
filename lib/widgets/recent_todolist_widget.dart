import 'package:flutter/material.dart';
import 'package:yournotes/utils/add_task_dialogbox.dart';
import 'package:yournotes/widgets/todo_tile.dart';

class RecentTodo extends StatefulWidget {
  const RecentTodo({super.key});

  @override
  State<RecentTodo> createState() => _RecentTodoState();
}
// list of to do tasks
  List toDoList = [
    ['Learn a new Widget', false],
    ['Pick up new friends', false],
  ];
class _RecentTodoState extends State<RecentTodo> {
  

  // text controller
  final _controller = TextEditingController();

  // Save new task
  void saveNewTask() {
    setState(() {
      toDoList.add([_controller.text.trim(), false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  //cretes a new task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return AddTaskDialog(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  // delete a task
  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  // checkbox tapped
  void checkboxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 30.0, right: 30.0, top: 20, bottom: 20),
      child: SizedBox(
        height: 500,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              height: 500,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 244, 223, 205),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(220),
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 2.0,
                    color: Color(0x33000000),
                    offset: Offset(1, 3),
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: ListView.builder(
                  padding: const EdgeInsets.all(0),
                  itemCount: toDoList.length,
                  itemBuilder: (context, index) {
                    return TodoTile(
                      taskName: toDoList[index][0],
                      taskCompleted: toDoList[index][1],
                      onChanged: (value) => checkboxChanged(value, index),
                      deleteFunction: (context) => deleteTask(index),
                    );
                  },
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                height: 70,
                width: 70,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(123, 131, 131, 131),
                  borderRadius: BorderRadius.all(
                    Radius.circular(40),
                  ),
                ),
                child: Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FloatingActionButton(
                          onPressed: createNewTask,
                          shape: const CircleBorder(),
                          backgroundColor: Colors.black,
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        )
                      ],
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
