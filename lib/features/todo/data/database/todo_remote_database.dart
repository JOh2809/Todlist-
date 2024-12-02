import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todolist/features/todo/domain/entities/todo.dart';

abstract class TodoRemoteDatabase {
  Future<Todo> addTodo(Todo todo);

  Future<Todo> editTodo(Todo todo);

  Future<Todo> deleteTodo(Todo todo);

  Stream<List<Todo>> listTodos();
}

class TodoRemoteDatabaseImpl implements TodoRemoteDatabase {
  @override
  Future<Todo> addTodo(Todo todo) async {
    await FirebaseFirestore.instance
        .collection('todos')
        .doc(todo.id.toString())
        .set(todo.toMap());
    return todo;
  }

  @override
  Future<Todo> deleteTodo(Todo todo) async {
    await FirebaseFirestore.instance.collection('todos').doc(todo.id as String?).delete();
    return todo;
  }

  @override
  Future<Todo> editTodo(Todo todo) async {
    await FirebaseFirestore.instance
        .collection('todos')
        .doc(todo.id as String?)
        .update(todo.toMap());
    return todo;
  }

  @override
  Stream<List<Todo>> listTodos() async* {
    yield* FirebaseFirestore.instance
        .collection('todos')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Todo.fromMap(doc.data())).toList();
    });
  }
}
