import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ExampleView extends StatelessWidget {
  ExampleView({super.key});
  final box = Hive.box('myBox');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Hive Example',
          ),
        ),
        body: const SizedBox(),
      ),
    );
  }
}
