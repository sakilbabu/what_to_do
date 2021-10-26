import 'package:what_to_do/domain/entities/todo_item.dart';

abstract class TodoRepository {
  Future<void> addTodoItem({required TodoItem todoItem});

  Future<List<TodoItem>> getAllTodoItem();

  Future<TodoItem> getTodoItemById({required int id});

  Future<void> updateTodoItem({required int id, required TodoItem todoItem});

  Future<void> deleteTodoItem({required int id});
}
