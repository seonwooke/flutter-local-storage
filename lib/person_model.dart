import 'dart:convert';

class PersonModel {
  final int id;
  final String name;
  final int age;
  final bool attend;

  PersonModel({
    required this.id,
    required this.name,
    required this.age,
    required this.attend,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'age': age,
      'attend': attend,
    };
  }

  factory PersonModel.fromMap(Map<String, dynamic> map) {
    return PersonModel(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      age: map['age'] ?? 0,
      attend: map['attend'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory PersonModel.fromJson(String source) =>
      PersonModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
