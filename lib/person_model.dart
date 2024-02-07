import 'package:hive/hive.dart';

part 'person_model.g.dart';

@HiveType(typeId: 0)
class PersonModel {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final int age;

  @HiveField(2)
  final bool attend;

  PersonModel({
    required this.name,
    required this.age,
    this.attend = false,
  });
}
