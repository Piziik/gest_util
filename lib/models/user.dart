import 'package:isar/isar.dart';

part 'user.g.dart';

@collection
class User {
  Id id = Isar.autoIncrement; // Identifiant auto-incrémenté

  late String name;
  late String email;
  late int age;

  User({
    required this.name,
    required this.email,
    required this.age,
  });
}
