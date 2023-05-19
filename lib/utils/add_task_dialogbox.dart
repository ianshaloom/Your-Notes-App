import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yournotes/utils/my_button.dart';

// ignore: must_be_immutable
class AddTaskDialog extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  AddTaskDialog({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Add New Task',
        style: GoogleFonts.poppins(
          color: Colors.black,
          fontSize: 16,
        ),
      ),
      //backgroundColor: const Color.fromARGB(255, 255, 213, 248),
      content: Container(
        height: 130,
        width: 300,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: TextField(
                controller: controller,
                textInputAction: TextInputAction.done,
                decoration: const InputDecoration(
                  icon: Icon(
                    Icons.edit_outlined,
                  ),
                  hintText: 'Add new Task',
                  border: InputBorder.none,
                ),
                style: GoogleFonts.shadowsIntoLightTwo(
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // save button
                  MyButton(text: 'Save', onPressed: onSave),
                  // cancel button
                  MyButton(text: 'Cancel', onPressed: onCancel),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
