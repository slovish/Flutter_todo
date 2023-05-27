import 'package:get/get.dart';

class listController extends GetxController {
  List<String> _todoList = [];
  List<String> _deletedList = [];

  List<String> get TodoList => _todoList;
  List<String> get DeletedList => _deletedList;

  void add_to_list(String text) {
    _todoList.add(text);
    update();
    print(_todoList);
  }

  void delete_from_list(int index) {
    _deletedList.add(_todoList[index]);
    _todoList.removeAt(index);
    update();
    print(_todoList);
  }
}
