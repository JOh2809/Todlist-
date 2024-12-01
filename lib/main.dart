import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/features/todo/presentation/bindings/todo_binding.dart';
import 'package:todolist/features/todo/presentation/pages/home.dart';
import 'package:todolist/features/todo/presentation/providers/todo_provider.dart';
import 'package:todolist/features/todo/entities/todo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:todolist/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: " Welcome To Do List",
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(
            name: '/', page: () => const HomePage(), binding: TodoBinding()),
      ],
    );
  }
}
