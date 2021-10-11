import 'package:flutter/material.dart';
import 'package:flutter_crud_sqflite/src/pages/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter CRUD',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
