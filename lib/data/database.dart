import 'package:hive/hive.dart';

class ToDoDataBase {
  List toDoList = [];

  //references our box
  final _myBox = Hive.box('mybox');

  //run this method if this is the first time ever opening this app
  void createInitialData() {
    toDoList = [
      ["Make Tutorial", false],
      ["Do Exercise", false],
    ];
  }

  //load the data from database
  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  //update the database
  void updateDataBase() {
    _myBox.put("TODOLIST", toDoList);
  }
}
