import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:todolist/features/todo/domain/entities/todo.dart';

/// Abstract class representing the remote database for managing todos.
abstract class TodoRemoteDatabase {
  /// Adds a new todo to the Firestore collection.
  Future<Todo> addTodo(Todo todo);

  /// Edits an existing todo in the Firestore collection.
  Future<Todo> editTodo(Todo todo);

  /// Removes a todo from the Firestore collection by its ID.
  Future<void> removeTodo(String todoId);

  /// Fetches all todos from the Firestore collection.
  Future<List<Todo>> listTodos();
}

/// Implementation of the TodoRemoteDatabase using Firestore.
class TodoRemoteDatabaseImpl implements TodoRemoteDatabase {
  // Reference to the Firestore collection named 'todos'.
  final _collection = FirebaseFirestore.instance.collection('todos');

  /// Adds a new todo to the Firestore collection.
  ///
  /// Takes a `Todo` object, converts it to a map using `toMap()`, and
  /// saves it as a document in the 'todos' collection with the provided `id`.
  /// Returns the added `Todo` object.
  @override
  Future<Todo> addTodo(Todo todo) async {
    try {
      await _collection.doc(todo.id).set(todo.toMap());
      return todo;
    } catch (e) {
      // Throws an exception if the operation fails.
      throw Exception('Failed to add todo: $e');
    }
  }

  /// Updates an existing todo in the Firestore collection.
  ///
  /// Takes a `Todo` object, converts it to a map using `toMap()`, and
  /// updates the document with the matching `id` in the 'todos' collection.
  /// Returns the updated `Todo` object.
  @override
  Future<Todo> editTodo(Todo todo) async {
    try {
      await _collection.doc(todo.id).update(todo.toMap());
      return todo;
    } catch (e) {
      // Throws an exception if the operation fails.
      throw Exception('Failed to edit todo: $e');
    }
  }

  /// Removes a todo from the Firestore collection by its ID.
  ///
  /// Deletes the document with the specified `todoId` from the 'todos' collection.
  @override
  Future<void> removeTodo(String todoId) async {
    try {
      await _collection.doc(todoId).delete();
    } catch (e) {
      // Throws an exception if the operation fails.
      throw Exception('Failed to remove todo: $e');
    }
  }

  /// Fetches all todos from the Firestore collection.
  ///
  /// Retrieves all documents from the 'todos' collection, converts each
  /// document to a `Todo` object using `fromMap()`, and returns the list of todos.
  @override
  Future<List<Todo>> listTodos() async {
    try {
      final querySnapshot = await _collection.get();
      return querySnapshot.docs
          .map((doc) => Todo.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      // Throws an exception if the operation fails.
      throw Exception('Failed to fetch todos: $e');
    }
  }
}
