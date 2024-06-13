import 'package:flutter/material.dart';
import 'user_list_screen.dart';
import 'settings_screen.dart';
import '../services/user_service.dart';

class HomeScreen extends StatefulWidget {
  final UserService userService;
  final ValueNotifier<Color> appBarColorNotifier;

  HomeScreen({required this.userService, required this.appBarColorNotifier});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> _widgetOptions = <Widget>[
      UserListScreen(userService: widget.userService),
      SettingsScreen(appBarColorNotifier: widget.appBarColorNotifier),
      const Center(
        child: Text('Déconnexion'),
      ),
    ];

    void _onItemTapped(int index) {
      if (index == 2) {
        Navigator.pushReplacementNamed(context, '/');
      } else {
        setState(() {
          _selectedIndex = index;
        });
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.appBarColorNotifier.value,
        title: const Center(
          child: Text(
            'Gestion des Utilisateurs',
            style: TextStyle(color: Colors.white),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Utilisateurs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Paramètres',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'Déconnexion',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
