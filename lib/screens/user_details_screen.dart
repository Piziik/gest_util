import 'package:flutter/material.dart';
import '../models/user.dart';

class UserDetailsScreen extends StatelessWidget {
  final User user;

  UserDetailsScreen({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Détails de l\'Utilisateur'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Prénom: ${user.firstName}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Nom: ${user.lastName}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Email: ${user.email}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Âge: ${user.age} ans', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Date de naissance: ${user.dateOfBirth ?? "N/A"}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Numéro de téléphone: ${user.phoneNumber ?? "N/A"}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Adresse: ${user.address ?? "N/A"}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Genre: ${user.gender ?? "N/A"}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Rôle: ${user.role}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Login: ${user.login}', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}