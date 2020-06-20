class Task {
  int id;
  String name;
  String deadLine;
  bool isDone;

  Task({this.id, this.name, this.deadLine, this.isDone = false});

  //databaseに保存する形に変換
  todoMap() {
    var map = Map<String, dynamic>();

    map['id'] = id;
    map['name'] = name;
    map['deadLine'] = deadLine;
    map['isDone'] = isDone == false ? 0 : 1; //bool > int
    return map;
  }

  void toggleDone() {
    isDone = !isDone;
  }
}
