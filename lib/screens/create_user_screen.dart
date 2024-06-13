import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import '../models/user.dart';

class CreateUserScreen extends StatefulWidget {
  final User? user;

  CreateUserScreen({this.user});

  @override
  _CreateUserScreenState createState() => _CreateUserScreenState();
}

class _CreateUserScreenState extends State<CreateUserScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _firstName;
  late String _lastName;
  late String _email;
  late int _age;
  late String? _dateOfBirth;
  late String? _address;
  late String? _phoneNumber;
  late String? _gender;
  late String _role;
  late String _login;
  late String _password;

  @override
  void initState() {
    super.initState();
    if (widget.user != null) {
      _firstName = widget.user!.firstName;
      _lastName = widget.user!.lastName;
      _email = widget.user!.email;
      _age = widget.user!.age;
      _dateOfBirth = widget.user!.dateOfBirth;
      _address = widget.user!.address;
      _phoneNumber = widget.user!.phoneNumber;
      _gender = widget.user!.gender;
      _role = widget.user!.role;
      _login = widget.user!.login;
      _password = widget.user!.password;
    } else {
      _firstName = '';
      _lastName = '';
      _email = '';
      _age = 0;
      _dateOfBirth = null;
      _address = null;
      _phoneNumber = null;
      _gender = null;
      _role = 'user'; // Valeur par défaut
      _login = '';
      _password = '';
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
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextFormField(
                  initialValue: _firstName,
                  decoration: InputDecoration(labelText: 'Prénom'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer un prénom';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _firstName = value!;
                  },
                ),
                TextFormField(
                  initialValue: _lastName,
                  decoration: InputDecoration(labelText: 'Nom'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer un nom';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _lastName = value!;
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
                TextFormField(
                  initialValue: _dateOfBirth,
                  decoration: InputDecoration(labelText: 'Date de naissance'),
                  onSaved: (value) {
                    _dateOfBirth = value;
                  },
                ),
                TextFormField(
                  initialValue: _phoneNumber,
                  decoration: InputDecoration(labelText: 'Numéro de téléphone'),
                  onSaved: (value) {
                    _phoneNumber = value;
                  },
                ),
                TextFormField(
                  initialValue: _address,
                  decoration: InputDecoration(labelText: 'Adresse'),
                  onSaved: (value) {
                    _address = value;
                  },
                ),
                TextFormField(
                  initialValue: _gender,
                  decoration: InputDecoration(labelText: 'Genre'),
                  onSaved: (value) {
                    _gender = value;
                  },
                ),
                DropdownButtonFormField<String>(
                  value: _role,
                  decoration: InputDecoration(labelText: 'Rôle'),
                  items: <String>['user', 'admin'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _role = value!;
                    });
                  },
                ),
                TextFormField(
                  initialValue: _login,
                  decoration: InputDecoration(labelText: 'Login'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer un login';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _login = value!;
                  },
                ),
                TextFormField(
                  initialValue: _password,
                  decoration: InputDecoration(labelText: 'Mot de passe'),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer un mot de passe';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _password = value!;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      final newUser = User(
                        id: widget.user?.id ?? Isar.autoIncrement,
                        firstName: _firstName,
                        lastName: _lastName,
                        email: _email,
                        age: _age,
                        dateOfBirth: _dateOfBirth,
                        phoneNumber: _phoneNumber,
                        address: _address,
                        gender: _gender,
                        role: _role,
                        login: _login,
                        password: _password,
                      );
                      Navigator.pop(context, newUser);
                    }
                  },
                  child: Text(widget.user == null ? 'Créer' : 'Modifier'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}