import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:login_api/frontend/view/auth/login_screen.dart';

void main() {
  testWidgets('Login Process Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(
      home: LoginPage(),
    ));

    // Fill in the username and password fields
    await tester.enterText(find.byKey(const Key('usernameField')), 'testuser');
    await tester.enterText(
        find.byKey(const Key('passwordField')), 'testpassword');

    // Tap the login button
    await tester.tap(find.byKey(const Key('loginButton')));
    await tester.pump();

    // Verify that after successful login, it navigates to the home page
    expect(find.text('Welcome to Home Page!'), findsOneWidget);
  });
}
