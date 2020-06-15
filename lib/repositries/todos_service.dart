import 'package:fluttertodo/models/task.dart';
import 'package:fluttertodo/repositries/repository.dart';

class TodosService {
  Repository _repository;
  TodosService() {
    _repository = Repository();
  }

  saveTodo(Task task) async {
    return await _repository.save('todos', task.todoMap());
  }

  getTodo() async {
    return await _repository.getAll('todos');
  }

  getTodoById(todoId) async {
    return await _repository.getById('todos', todoId);
  }

  updateTodo(Task task) async {
    return await _repository.update('todos', task.todoMap());
  }

  deleteTodo(int todoId) async {
    return await _repository.delete('todos', todoId);
  }
}
