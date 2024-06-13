import 'package:isar/isar.dart';

part 'user.g.dart';

@collection
class User {
  Id id = Isar.autoIncrement;

  late String firstName;
  late String lastName;
  late String email;
  late int age;

  User({
    this.id = Isar.autoIncrement,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.age,
  });
}