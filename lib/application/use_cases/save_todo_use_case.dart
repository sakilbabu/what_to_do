import 'package:what_to_do/domain/entities/todo_item.dart';
import 'package:what_to_do/domain/repositories/todo_repository.dart';

import 'base_use_case.dart';

class SaveTodoUseCase implements BaseUseCase<void, TodoItem> {
  final TodoRepository _todoRepository;

  SaveTodoUseCase(this._todoRepository);

  @override
  Future<void> call(TodoItem request) {
    return _todoRepository.addTodoItem(todoItem: request);
  }
}
