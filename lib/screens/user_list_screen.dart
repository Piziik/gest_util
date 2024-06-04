import 'package:flutter/material.dart';
import 'create_user_screen.dart';
import '../models/user.dart';
import '../services/user_service.dart';

class UserListScreen extends StatefulWidget {
  final UserService userService;

  UserListScreen({required this.userService});

  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des Utilisateurs'),
      ),
      body: ListView.builder(
        itemCount: widget.userService.getUsers().length,
        itemBuilder: (context, index) {
          final user = widget.userService.getUsers()[index];
          return ListTile(
            title: Text(user.name),
            subtitle: Text('${user.email}\nÂge: ${user.age} ans'),
            isThreeLine: true,
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreateUserScreen(user: user),
                      ),
                    );
                    if (result != null && result is User) {
                      setState(() {
                        widget.userService.updateUser(index, result);
                      });
                    }
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    setState(() {
                      widget.userService.deleteUser(index);
                    });
                  },
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreateUserScreen(),
            ),
          );
          if (result != null && result is User) {
            setState(() {
              widget.userService.addUser(result);
            });
          }
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}