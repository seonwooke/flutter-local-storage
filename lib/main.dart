import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'example_view.dart';
import 'person_model.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(PersonModelAdapter());
  await Hive.openBox<PersonModel>('AttendanceBook');

  runApp(ExampleView());
}
