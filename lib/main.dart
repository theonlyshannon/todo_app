import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/user.dart';
import 'models/task.dart';
import 'screen/login_page.dart' as login;  // Menggunakan alias untuk menghindari konflik
import 'screen/register_page.dart' as register;
import 'screen/todo_list_page.dart' as todo;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(TaskAdapter());
  await Hive.openBox<User>('users');
  await Hive.openBox<Task>('tasks');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter To-Do App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => login.LoginPage(),  
        '/register': (context) => register.RegisterPage(),  
        '/todo': (context) => todo.ToDoListPage(),  
      },
    );
  }
}
