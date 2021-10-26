import 'package:what_to_do/domain/entities/todo_item.dart';
import 'package:what_to_do/domain/repositories/todo_repository.dart';
import 'base_use_case.dart';

class UpdateTodoUseCase implements BaseUseCase<List<TodoItem>, TodoItem> {
  final TodoRepository _todoRepository;

  UpdateTodoUseCase(this._todoRepository);

  @override
  Future<List<TodoItem>> call(TodoItem request) async {
    await _todoRepository.updateTodoItem(id: request.id, todoItem: request);

    return _todoRepository.getAllTodoItem();
  }
}
