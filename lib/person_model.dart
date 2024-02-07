import 'package:hive/hive.dart';

part 'person_model.g.dart';

@HiveType(typeId: 0)
class PersonModel {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final int age;

  @HiveField(3)
  final bool attend;

  PersonModel({
    required this.id,
    required this.name,
    this.age = 20,
    this.attend = false,
  });
}
