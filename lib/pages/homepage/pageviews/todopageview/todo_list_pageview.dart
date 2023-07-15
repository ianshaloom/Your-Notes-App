import 'package:flutter/material.dart';
import 'package:yournotes/utils/add_task_dialogbox.dart';
import 'package:yournotes/widgets/todo_tile.dart';

class TodoListPageView extends StatefulWidget {
  const TodoListPageView({super.key});

  @override
  State<TodoListPageView> createState() => _TodoListPageViewState();
}

// list of to do tasks
List toDoList = [
  ['Learn a new Widget', false],
  ['Pick up new friends', false],
];

class _TodoListPageViewState extends State<TodoListPageView> {
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
      toDoList[index][1] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
      child: SizedBox(
        height: double.infinity,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 244, 223, 205),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
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
                padding: const EdgeInsets.only(top: 5.0),
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
              bottom: 5,
              right: 5,
              child: Container(
                height: 70,
                width: 70,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 244, 236),
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
                          heroTag: null,
                          onPressed: createNewTask,
                          elevation: 0,
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
