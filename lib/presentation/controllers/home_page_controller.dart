import 'package:get/get.dart';
import 'package:what_to_do/application/use_cases/base_use_case.dart';
import 'package:what_to_do/application/use_cases/delete_todo_use_case.dart';
import 'package:what_to_do/application/use_cases/get_all_todo_use_case.dart';
import 'package:what_to_do/application/use_cases/save_todo_use_case.dart';
import 'package:what_to_do/domain/entities/todo_item.dart';

class MyHomePageController extends GetxController {
  final GetAllTodoUseCase _getAllTodoUseCase;
  final SaveTodoUseCase _saveTodoUseCase;
  final DeleteTodoUseCase _deleteTodoUseCase;
  final todos = <TodoItem>[].obs;

  final id = Rx<int>(0);
  final description = Rx<String>('');

  MyHomePageController(
    this._getAllTodoUseCase,
    this._saveTodoUseCase,
    this._deleteTodoUseCase,
  );

  saveTodo() async {
    var newTodo = TodoItem(id: id.value, description: description.value);

    await _saveTodoUseCase.call(newTodo);
  }

  getTodos() async {
    final result = await _getAllTodoUseCase.call(EmptyRequest());

    todos.assignAll(result);
  }

  @override
  void onInit() async {
    super.onInit();
    await getTodos();
  }

  deleteTodo(int id) async {
    final response = await _deleteTodoUseCase.call(id);

    todos.assignAll(response);
  }
}
