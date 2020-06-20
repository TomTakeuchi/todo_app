import 'package:flutter/material.dart';
import 'package:fluttertodo/models/task_data.dart';
import 'package:intl/intl.dart';
import 'package:fluttertodo/utility.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  TextEditingController selectDateController = TextEditingController();

  DateTime selectedDate = DateTime.now();

  String dTime;

  String taskTitle;

  void selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020, 1),
      lastDate: DateTime(2100, 1),
    );

    if (picked != null) {
      setState(() {
        selectDateController.text = (DateFormat.yMMMd()).format(picked);
        //datetime > String に変換
        dTime = selectDateController.text;

        //ここで選択された値を変数なり、コントローラーに代入する
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(8, 9, 18, 1),
      child: Container(
        padding: EdgeInsets.all(30.0),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: Column(
          children: <Widget>[
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0,
                  color: Colors.white),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                border: Border.all(color: Colors.green, width: 1.5),
                borderRadius: BorderRadius.circular(17.0),
              ),
              margin: EdgeInsets.all(15.0),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 3.0, 8.0, 5.0),
                child: TextField(
                  cursorColor: Colors.white,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.0,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Enter your task',
                    hintStyle: TextStyle(
                      fontSize: 17.0,
                    ),
                  ),
                  onChanged: (value) {
                    taskTitle = value.toString();
                  },
                ),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                border: Border.all(color: Colors.green, width: 1.5),
                borderRadius: BorderRadius.circular(17.0),
              ),
              margin: EdgeInsets.all(15.0),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 3.0, 8.0, 5.0),
                child: TextFormField(
                  focusNode: AlwaysDisableFocusNode(),
                  controller: selectDateController,
                  cursorColor: Colors.white,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.0,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Dead line',
                    hintStyle: TextStyle(
                      fontSize: 17.0,
                    ),
                  ),
                  onChanged: (value) {
                    dTime = value.toString();
                  },
                  onTap: () => selectDate(context),
                ),
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            FlatButton(
              child: Text(
                'ADD',
                style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
              ),
              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
              color: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              onPressed: () {
                if (taskTitle != null && dTime != null) {
                  Provider.of<TaskData>(context, listen: false)
                      .addTask(taskTitle, dTime);
                  //入力した内容をリストに追加
                  Navigator.pop(context);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
