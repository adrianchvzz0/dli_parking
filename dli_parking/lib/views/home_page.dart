import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/auth_google.dart';
import '../models/app_model.dart';
import 'login_page.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/home';
  final AppUser user;

  const HomePage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenido'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              final authController =
                  Provider.of<AuthController>(context, listen: false);
              authController.signOut();
              Navigator.pushReplacementNamed(context, LoginPage.routeName);
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Nombre: ${user.name}'),
            Text('Email: ${user.email}'),
            user.photoUrl.isNotEmpty
                ? Image.network(user.photoUrl)
                : Icon(Icons.account_circle, size: 50),
          ],
        ),
      ),
    );
  }
}
