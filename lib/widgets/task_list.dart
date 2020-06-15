import 'package:flutter/material.dart';
import 'package:fluttertodo/models/task_data.dart';
import 'package:fluttertodo/widgets/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TaskList extends StatefulWidget {
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskData, child) {
      return ListView.builder(
        itemBuilder: (context, index) {
          final task = taskData.tasks[index];
          return ClipRRect(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(17.0),
              bottomRight: Radius.circular(17.0),
            ),
            child: Slidable(
              actionPane: SlidableDrawerActionPane(),
              actionExtentRatio: 0.2,
              child: TaskTile(
                taskTitle: task.name,
                time: task.deadLine,
                isChecked: task.isDone,
                checkBoxCallBack: (checkboxState) {
                  taskData.updateTask(task);
                },
              ),
              secondaryActions: <Widget>[
                IconSlideAction(
                  caption: 'Delete',
                  color: Colors.red,
                  icon: Icons.delete,
                  onTap: () {
                    setState(() {
                      taskData.deleteTask(index, taskData.tasks[index]);
                    });
                  },
                )
              ],
            ),
          );
        },
        itemCount: taskData.tasks.length,
      );
    });
  }
}
