import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'example_view.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox('myBox');

  runApp(ExampleView());
}
