import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/auth_google.dart';
import '../models/app_model.dart';
import 'home_page.dart';

class LoginPage extends StatelessWidget {
  static const String routeName = '/login';

  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final authController =
                Provider.of<AuthController>(context, listen: false);
            final user = await authController.signInWithGoogle();
            if (user != null) {
              Navigator.pushReplacementNamed(context, HomePage.routeName,
                  arguments: user);
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Iniciar sesión con Google',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
