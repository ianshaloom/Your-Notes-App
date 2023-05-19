import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class TodoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  TodoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 10, top: 15),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(20),
            )
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(1),
          //height: 45,
          decoration: const BoxDecoration(
            color: Color.fromARGB(213, 255, 253, 253),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Row(
            children: [
              Checkbox(
                shape: const CircleBorder(),
                value: taskCompleted,
                onChanged: onChanged,
              ),
              Text(
                taskName,
                style: GoogleFonts.shadowsIntoLightTwo(
                  decoration: taskCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
