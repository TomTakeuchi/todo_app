import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function checkBoxCallBack;
  final String time;

  TaskTile({this.isChecked, this.taskTitle, this.checkBoxCallBack, this.time});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        style: TextStyle(
          fontSize: 17.0,
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      subtitle: Text(time.toString()),
      trailing: Checkbox(
        activeColor: Colors.green,
        value: isChecked,
        onChanged: checkBoxCallBack,
      ),
    );
  }
}
