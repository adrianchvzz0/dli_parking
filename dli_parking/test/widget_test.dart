import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:dli_parking/main.dart';
import 'package:dli_parking/controllers/auth_google.dart';
import 'package:dli_parking/views/home_page.dart';
import 'package:dli_parking/views/login_page.dart';
import 'package:dli_parking/models/app_model.dart';

void main() {
  testWidgets('LoginPage displays login button', (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          Provider<AuthController>(create: (_) => AuthController()),
        ],
        child: MaterialApp(
          initialRoute: LoginPage.routeName,
          routes: {
            LoginPage.routeName: (context) => const LoginPage(),
            HomePage.routeName: (context) => HomePage(
                  user: AppUser(
                    id: 'test_id',
                    name: 'Test User',
                    email: 'test@example.com',
                    photoUrl: '',
                  ),
                ),
          },
        ),
      ),
    );

    expect(find.text('Iniciar sesión con Google'), findsOneWidget);
  });

  testWidgets('HomePage displays user info', (WidgetTester tester) async {
    final testUser = AppUser(
      id: 'test_id',
      name: 'Test User',
      email: 'test@example.com',
      photoUrl: '',
    );

    await tester.pumpWidget(
      MaterialApp(
        home: HomePage(user: testUser),
      ),
    );

    expect(find.text('Nombre: Test User'), findsOneWidget);
    expect(find.text('Email: test@example.com'), findsOneWidget);
  });
}
