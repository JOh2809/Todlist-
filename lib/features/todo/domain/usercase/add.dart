import 'package:dartz/dartz.dart';

import '../../../../shared/errors/failure.dart';
import '../../../../shared/utils/usecase.dart';
import '../entities/todo.dart';
import '../repositories/todo_repository.dart';

class AddTodoUseCase implements UseCase<Todo, Params<Todo>> {
  final TodoRepository repository;
  AddTodoUseCase(this.repository);

  @override
  Future<Either<Failure, Todo>> call(Params params) async {
    return await repository.add(params.data);
  }
}
