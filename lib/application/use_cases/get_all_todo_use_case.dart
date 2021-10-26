import 'package:what_to_do/domain/entities/todo_item.dart';
import 'package:what_to_do/domain/repositories/todo_repository.dart';

import 'base_use_case.dart';

class GetAllTodoUseCase implements BaseUseCase<List<TodoItem>, EmptyRequest> {
  final TodoRepository _todoRepository;

  GetAllTodoUseCase(this._todoRepository);

  @override
  Future<List<TodoItem>> call(EmptyRequest request) {
    return _todoRepository.getAllTodoItem();
  }
}
