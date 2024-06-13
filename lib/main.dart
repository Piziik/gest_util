import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'services/user_service.dart';
import 'models/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Future<Isar> initializeIsar() async {
    final dir = await getApplicationDocumentsDirectory();
    return await Isar.open(
      [UserSchema],
      directory: dir.path,
    );
  }

  final isar = await initializeIsar();
  final userService = UserService(isar);

  runApp(MyApp(userService: userService));
}

class MyApp extends StatelessWidget {
  final ValueNotifier<Color> appBarColorNotifier = ValueNotifier<Color>(Colors.red);

  final UserService userService;

  MyApp({required this.userService});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Color>(
      valueListenable: appBarColorNotifier,
      builder: (context, color, child) {
        return MaterialApp(
          title: 'Gestion des Utilisateurs',
          theme: ThemeData(
            primarySwatch: Colors.red,
            appBarTheme: AppBarTheme(
              backgroundColor: color,
            ),
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => LoginScreen(userService: userService, appBarColorNotifier: appBarColorNotifier),
          },
          onGenerateRoute: (settings) {
            if (settings.name == '/home') {
              final args = settings.arguments as Map<String, dynamic>;
              return MaterialPageRoute(
                builder: (context) {
                  return HomeScreen(
                    userService: args['userService'],
                    currentUser: args['currentUser'],
                    appBarColorNotifier: appBarColorNotifier,
                  );
                },
              );
            }
            return null;
          },
        );
      },
    );
  }
}