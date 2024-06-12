import 'package:isar/isar.dart';
import '../models/user.dart';

class UserService {
  final Isar db;

  UserService(this.db);

  Future<List<User>> getUsers() async {
    return await db.users.where().findAll();
  }

  Future<void> addUser(User user) async {
    await db.writeTxn(() async {
      await db.users.put(user);
    });
  }

  Future<void> updateUser(User user) async {
    await db.writeTxn(() async {
      await db.users.put(user);
    });
  }

  Future<void> deleteUser(int id) async {
    await db.writeTxn(() async {
      await db.users.delete(id);
    });
  }
}