import 'package:dartz/dartz.dart';

import 'package:todolist/features/todo/domain/entities/todo.dart';
import 'package:todolist/shared/errors/failure.dart';

abstract class TodoRepository {
  Future<Either<Failure, Todo>> add(Todo todo);

  Future<Either<Failure, Todo>> edit(Todo todo);

  Future<Either<Failure, Todo>> delete(Todo todo);

  Future<Either<Failure, Stream<List<Todo>>>> getAll();
}
