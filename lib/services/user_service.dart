import '../models/user.dart';

class UserService {
  // Liste des utilisateurs en mémoire
  List<User> _users = [];

  // Retourne tous les utilisateurs
  List<User> getUsers() {
    return _users;
  }

  // Ajoute un utilisateur
  void addUser(User user) {
    _users.add(user);
  }

  // Met à jour un utilisateur
  void updateUser(int index, User user) {
    if (index >= 0 && index < _users.length) {
      _users[index] = user;
    }
  }

  // Supprime un utilisateur
  void deleteUser(int index) {
    if (index >= 0 && index < _users.length) {
      _users.removeAt(index);
    }
  }
}