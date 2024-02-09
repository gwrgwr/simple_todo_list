import 'package:flutter/material.dart';
import 'package:todo_list/data/list_data.dart';
import 'package:todo_list/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return TaskList(
        child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        dividerTheme: DividerThemeData(
          thickness: 2,
          color: Colors.white,
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginPage(),
    ));
  }
}
