import 'package:flutter/material.dart';
import 'package:json_file/features/presentation/widgets/data_back_screen.dart';
import 'package:json_file/features/presentation/widgets/json_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(

      debugShowCheckedModeBanner: false,
      home: ShowDataBack(),
    );
  }
}
