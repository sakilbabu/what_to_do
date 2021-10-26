import 'package:get/get.dart';
import 'package:what_to_do/application/use_cases/delete_todo_use_case.dart';
import 'package:what_to_do/application/use_cases/get_all_todo_use_case.dart';
import 'package:what_to_do/application/use_cases/save_todo_use_case.dart';
import 'package:what_to_do/application/use_cases/update_todo_use_case.dart';
import 'package:what_to_do/domain/repositories/todo_repository.dart';
import 'package:what_to_do/infrastructure/data_source/local/local_todo_provider.dart';
import 'package:what_to_do/infrastructure/repositories/todo_repository.dart';
import 'package:what_to_do/presentation/controllers/edit_page_controller.dart';
import 'package:what_to_do/presentation/controllers/home_page_controller.dart';

class AppBinding extends Bindings {
  final find = Get.find;

  @override
  void dependencies() {
    Get.lazyPut<LocalTodoProvider>(() => LocalTodoProviderImpl());
    Get.lazyPut<TodoRepository>(() => TodoRepositoryImpl(find()));
    Get.lazyPut(() => GetAllTodoUseCase(find()));
    Get.lazyPut(() => SaveTodoUseCase(find()));
    Get.lazyPut(() => DeleteTodoUseCase(find()));
    Get.lazyPut(() => UpdateTodoUseCase(find()));
    Get.lazyPut(() => MyHomePageController(find(), find(), find()));
    Get.lazyPut(() => MyEditPageController(find()));
  }
}
