import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/features/todo/domain/entities/todo.dart';
import 'package:todolist/features/todo/presentation/providers/todo_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoControllerProvider);


    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo Clean Architecture'),
      ),
      body: todos.isEmpty
          ? const Center(child: Text("No todos found"))
          : ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(todos[index].text),
                  subtitle: Text(todos[index].description),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        splashRadius: 20,
                        onPressed: () {
                          // Show the modal bottom sheet for editing
                          showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            builder: (context) {
                              final titleController =
                                  TextEditingController(text: todos[index].text);
                              final descriptionController =
                                  TextEditingController(text: todos[index].description);

                              return Container(
                                width: double.maxFinite,
                                height: MediaQuery.of(context).size.height * 0.8,
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Form(
                                    child: Column(
                                      children: [
                                        TextFormField(
                                          controller: titleController,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Title is required';
                                            }
                                            return null;
                                          },
                                          decoration: const InputDecoration(
                                            labelText: 'Title',
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(bottom: 8.0),
                                          child: TextFormField(
                                            controller: descriptionController,
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'Description is required';
                                              }
                                              return null;
                                            },
                                            decoration: const InputDecoration(
                                              labelText: 'Description',
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: double.maxFinite,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              // Update the todo
                                              ref.read(todoControllerProvider.notifier).editTodo(
                                                  id: todos[index].id,
                                                  text: titleController.text.trim(),
                                                  description: descriptionController.text.trim());
                                              Navigator.pop(context);
                                            },
                                            child: const Text('Edit Todo'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        icon: const Icon(Icons.edit),
                      ),
                      IconButton(
                        splashRadius: 20,
                        onPressed: () {
                          ref.read(todoControllerProvider.notifier).deleteTodo(todo: todos[index]);
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            showDragHandle: true,
            isScrollControlled: true,
            context: context,
            builder: (context) {
              final titleController = TextEditingController();
              final descriptionController = TextEditingController();

              return Container(
                width: double.maxFinite,
                height: MediaQuery.of(context).size.height * 0.8,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    child: Column(
                      children: [
                        TextFormField(
                          controller: titleController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Title is required';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            labelText: 'Title',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: TextFormField(
                            controller: descriptionController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Description is required';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              labelText: 'Description',
                            ),
                          ),
                        ),
                        SizedBox(
                          width: double.maxFinite,
                          child: ElevatedButton(
                            onPressed: () {
                              // Add new todo
                              ref.read(todoControllerProvider.notifier).addTodo(
                                titleController.text.trim(),
                                descriptionController.text.trim(),
                                DateTime.now().toIso8601String(), // Assuming the third argument is a DateTime for the creation date
                              );
                              Navigator.pop(context);
                            },
                            child: const Text('Add Todo'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
