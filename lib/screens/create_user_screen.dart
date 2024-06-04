import 'package:flutter/material.dart';
import '../models/user.dart';

class CreateUserScreen extends StatefulWidget {
  final User? user;

  CreateUserScreen({this.user});

  @override
  _CreateUserScreenState createState() => _CreateUserScreenState();
}

class _CreateUserScreenState extends State<CreateUserScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late String _email;
  late int _age;

  @override
  void initState() {
    super.initState();
    if (widget.user != null) {
      _name = widget.user!.name;
      _email = widget.user!.email;
      _age = widget.user!.age;
    } else {
      _name = '';
      _email = '';
      _age = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.user == null ? 'Créer un Utilisateur' : 'Modifier un Utilisateur'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: _name,
                decoration: InputDecoration(labelText: 'Nom'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer un nom';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value!;
                },
              ),
              TextFormField(
                initialValue: _email,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer un email';
                  }
                  return null;
                },
                onSaved: (value) {
                  _email = value!;
                },
              ),
              TextFormField(
                initialValue: _age != 0 ? _age.toString() : '',
                decoration: InputDecoration(labelText: 'Âge'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer un âge';
                  }
                  final age = int.tryParse(value);
                  if (age == null || age <= 0) {
                    return 'Veuillez entrer un âge valide';
                  }
                  return null;
                },
                onSaved: (value) {
                  _age = int.parse(value!);
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    final newUser = User(name: _name, email: _email, age: _age);
                    Navigator.pop(context, newUser);
                  }
                },
                child: Text(widget.user == null ? 'Créer' : 'Modifier'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}