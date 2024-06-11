import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:universal_io/io.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import '../models/user.dart';

class UserService {
  late Future<Isar> db;

  UserService() {
    db = _initDb();
  }

  Future<Isar> _initDb() async {
    if (kIsWeb) {
      // Pour le Web, utilisez un chemin par défaut
      return await Isar.open(
        [UserSchema],
        directory: null, // Le Web n'a pas besoin de directory
      );
    } else {
      // Pour les plateformes non-Web (Android, iOS, macOS, Linux, Windows)
      final dir = await getApplicationDocumentsDirectory();
      return await Isar.open(
        [UserSchema],
        directory: dir.path,
      );
    }
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
