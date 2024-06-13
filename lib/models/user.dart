import 'package:isar/isar.dart';

part 'user.g.dart';

@collection
class User {
  Id id = Isar.autoIncrement;

  late String firstName;
  late String lastName;
  late String email;
  late int age;
  String? dateOfBirth; // Champ optionnel
  String? address; // Champ optionnel
  String? phoneNumber; // Champ optionnel
  String? gender; // Champ optionnel
  late String role; // Champ obligatoire avec valeur par défaut
  late String login; // Champ obligatoire
  late String password; // Champ obligatoire

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
    this.role = 'user', // Valeur par défaut
    required this.login,
    required this.password,
  });
}