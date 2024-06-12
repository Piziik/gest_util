import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../models/user.dart';

class UserService {
  late Future<Isar> db;

  UserService() {
    db = _initDb();
  }

  Future<Isar> _initDb() async {
    final dir = await getApplicationDocumentsDirectory();
    return await Isar.open(
      [UserSchema],
      directory: dir.path,
    );
  }

  Future<List<User>> getUsers() async {
    final isar = await db;
    return await isar.users.where().findAll();
  }

  Future<void> addUser(User user) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.users.put(user);
    });
  }

  Future<void> updateUser(User user) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.users.put(user);
    });
  }

  Future<void> deleteUser(int id) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.users.delete(id);
    });
  }
}