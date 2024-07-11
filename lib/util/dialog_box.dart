import 'package:flutter/material.dart';
import 'package:to_do_app/util/my_buttom.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCacel;

  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCacel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //get user input
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a new task",
              ),
            ),

            //button => save + cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //save button
                MyButtom(text: "Save", onPressed: onSave),

                const SizedBox(
                  width: 8,
                ),

                //cancel button
                MyButtom(text: "Cancel", onPressed: onCacel),
              ],
            )
          ],
        ),
      ),
    );
  }
}
