import 'package:isar/isar.dart';

part 'user.g.dart';

@collection
class User {
  Id id = Isar.autoIncrement;

  String firstName;
  String lastName;
  String email;
  int age;
  String? dateOfBirth; // Optional
  String? address; // Optional
  String? phoneNumber; // Optional
  String? gender; // Optional
  String role; // Required, default value : user
  String login; // Required
  String password; // Required

  User({
    this.id = Isar.autoIncrement,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.age,
    this.dateOfBirth,
    this.address,
    this.phoneNumber,
    this.gender,
    this.role = 'user',
    required this.login,
    required this.password,
  });
}