class PersonModel {
  final int id;
  final String name;
  final int age;
  final bool attend;

  PersonModel({
    required this.id,
    required this.name,
    this.age = 20,
    this.attend = false,
  });
}
