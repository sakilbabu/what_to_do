import 'package:what_to_do/domain/entities/todo_item.dart';
import 'package:what_to_do/domain/repositories/todo_repository.dart';
import 'base_use_case.dart';

class DeleteTodoUseCase implements BaseUseCase<List<TodoItem>, int> {
  final TodoRepository _todoRepository;

  DeleteTodoUseCase(this._todoRepository);
  @override
  Future<List<TodoItem>> call(int request) async {
    await _todoRepository.deleteTodoItem(id: request);

    return _todoRepository.getAllTodoItem();
  }
}
