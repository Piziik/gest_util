import 'package:flutter/material.dart';
import '../services/user_service.dart';
import '../models/user.dart';

class LoginScreen extends StatefulWidget {
  final UserService userService;
  final ValueNotifier<Color> appBarColorNotifier;

  LoginScreen({required this.userService, required this.appBarColorNotifier});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() async {
    if (_formKey.currentState!.validate()) {
      final login = _loginController.text;
      final password = _passwordController.text;

      // Vérifier si la base de données est vide
      final isDatabaseEmpty = await widget.userService.isDatabaseEmpty();

      if (isDatabaseEmpty && login == "admin" && password == "password") {
        final adminUser = User(
          firstName: 'Admin',
          lastName: 'User',
          email: 'admin@example.com',
          age: 0,
          login: 'admin',
          password: 'password',
          role: 'admin',
        );
        Navigator.pushReplacementNamed(
          context,
          '/home',
          arguments: {'userService': widget.userService, 'currentUser': adminUser},
        );
      } else {
        final user = await widget.userService.authenticate(login, password);
        if (user != null) {
          Navigator.pushReplacementNamed(
            context,
            '/home',
            arguments: {'userService': widget.userService, 'currentUser': user},
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Pseudo ou mot de passe incorrect")),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.appBarColorNotifier.value,
        title: Center(
          child: Text(
            'Connexion',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: _loginController,
                decoration: InputDecoration(labelText: 'Login'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre login';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Mot de passe'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre mot de passe';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _login,
                child: Text('Se connecter'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}