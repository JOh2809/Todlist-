import 'package:get/get.dart';
import 'package:todolist/features/todo/data/database/repositories/todo_repository_impl.dart';
import 'package:todolist/features/todo/data/database/todo_remote_database.dart';
import 'package:todolist/features/todo/domain/usercase/add.dart';
import 'package:todolist/features/todo/domain/usercase/delete.dart';
import 'package:todolist/features/todo/domain/usercase/edit.dart';
import 'package:todolist/features/todo/domain/usercase/list.dart';
import 'package:todolist/features/todo/presentation/controller/todo_controller.dart';

import '../../domain/repositories/todo_repository.dart';

class TodoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TodoRemoteDatabase>(() => TodoRemoteDatabaseImpl());
    Get.lazyPut<TodoRepository>(
        () => TodoRepositoryImpl(remoteDatabase: Get.find()));
    Get.lazyPut(() => AddTodoUseCase(Get.find()));
    Get.lazyPut(() => ListTodoUseCase(Get.find()));
    Get.lazyPut(() => DeleteTodoUseCase(Get.find()));
    Get.lazyPut(() => EditTodoUseCase(Get.find()));
    Get.lazyPut(() => TodoController(
        addTodoUseCase: Get.find(),
        listTodoUseCase: Get.find(),
        deleteTodoUseCase: Get.find(),
        editTodoUseCase: Get.find()));
  }
}
