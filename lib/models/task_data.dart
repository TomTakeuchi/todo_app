import 'dart:collection';
import 'package:fluttertodo/repositries/todos_service.dart';

import 'package:flutter/material.dart';
import 'task.dart';
import 'package:flutter/foundation.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [];
  TodosService todosService = TodosService();

//  UnmodifiableListView<Task> get tasks {
//    return UnmodifiableListView(_tasks);
//  }

  int get taskCount {
    return tasks.length;
  }

  void addTask(String newTaskTitle, String date) async {
    final newTask = Task(name: newTaskTitle, deadLine: date, isDone: false);
    int todoId = await todosService.saveTodo(newTask);
    //先に　databaseに追加 > idを取得 > そのidで管理できる
    print(todoId);
    Task todo = Task(name: newTaskTitle, deadLine: date, id: todoId);
    tasks.add(todo);
    notifyListeners();
  }

  void updateTask(Task task) async {
    task.toggleDone();
    await todosService.updateTodo(task); //0 <=> 1
    notifyListeners();
  }

  void deleteTask(int index, Task task) async {
    tasks.removeAt(index);
    await todosService.deleteTodo(task.id);
    print(task.id);
    notifyListeners();
  }
}
