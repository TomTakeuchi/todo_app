import 'package:flutter/material.dart';
import 'package:fluttertodo/models/task.dart';
import 'package:fluttertodo/repositries/todos_service.dart';
import 'package:fluttertodo/widgets/task_list.dart';
import 'package:provider/provider.dart';
import 'package:fluttertodo/models/task_data.dart';
import 'package:fluttertodo/screens/addTask_screen.dart';

class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  var _todosService = TodosService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllTodos();
  }

  getAllTodos() async {
    var tasks = await _todosService.getTodo();
    tasks.forEach((task) async {
      setState(() {
        print(task['name']);
        print('id=${task['id']}');
        print(task['deadLine']);
        print(task['isDone']);
        Task todo = Task(
            name: task['name'],
            deadLine: task['deadLine'],
            id: task['id'],
            isDone: task['isDone'] == 0 ? false : true);
        Provider.of<TaskData>(context, listen: false).tasks.add(todo);
      });
    });
    print(Provider.of<TaskData>(context, listen: false).tasks.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          showModalBottomSheet(
              context: context, builder: (context) => AddTaskScreen());
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
                top: 33.0, left: 30.0, right: 30.0, bottom: 5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      'Your Task',
                      style: TextStyle(
                        fontSize: 33.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 11,
                    ),
                    CircleAvatar(
                      child: Icon(
                        Icons.list,
                        size: 17.0,
                        color: Colors.white,
                      ),
                      backgroundColor: Colors.green,
                      radius: 17.0,
                    ),
                  ],
                ),
                Text(
                  ' ${Provider.of<TaskData>(context).taskCount} tasks',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.0,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 12.0,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.7,
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
//              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.0),
              ),
            ),
            child: TaskList(),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).scaffoldBackgroundColor,
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 45,
        ),
      ),
    );
  }
}
