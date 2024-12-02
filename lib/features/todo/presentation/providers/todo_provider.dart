import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/features/todo/domain/entities/todo.dart';

//state notifier for managing todo state
class TodoController extends StateNotifier<List<Todo>>{
  TodoController() : super([]);

  //simulate fetching todos
  Future<void> fetchTodos() async{
    //replace with actual logic
    state = [
      Todo(
        id: 1,
        text: 'Todo 1',
        description: 'Description 1',
      ),
      Todo(
        id: 2,
        text: 'Todo 2',
        description: 'Description 2',
      ),
    ];
  }

  //add a new todo
  void addTodo(String id, String text, String description){
    print('Adding todo - PROVIDER');
    state = [
      ...state,
      Todo(
        id: state.length + 1,
        text: text,
        description: description,
      ),
    ];
  }

  //edit a todo
  void editTodo({
    required int id,
    required String text,
    required String description,
  }){
    print('Editing todo - PROVIDER');
    state = state.map((todo) => todo.id == id ? Todo(
      id: id,
      text: text,
      description: description,
    ) : todo).toList();
  }

  //delete a todo
  void deleteTodo({
    required Todo todo,
  }){
    print('Deleting todo - PROVIDER');
    state = state.where((element) => element.id != todo.id).toList();
  }



}

//provider for the todo controller
final todoControllerProvider = StateNotifierProvider<TodoController, List<Todo>>((ref) => TodoController());