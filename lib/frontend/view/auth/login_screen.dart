import 'package:flutter/material.dart';

import '../../models/login_model.dart';
import '../../services/api_service.dart';
import '../../utils/SharedPreferencesManager.dart';
import '../home/dashboard.dart';
import 'sign_up_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Exceloid',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 60),
            const Text(
              'Login to your Account',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 5),
            SizedBox(
              width: double.infinity,
              child: TextField(
                controller: usernameController,
                decoration: const InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: isLoading ? null : _login,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                padding: const EdgeInsets.all(16.0),
                minimumSize:
                    const Size(double.infinity, 50), // Adjusted button size
              ),
              child: isLoading
                  ? const CircularProgressIndicator()
                  : const Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                // Implement forgot password logic
              },
              child: const Text(
                'Forgot Password?',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.blue,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'or sign in with',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Implement social sign-in buttons (Google, Facebook, Twitter)
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              "don't have an account?",
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUpScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              child: const Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _login() async {
    final username = usernameController.text.trim();
    final password = passwordController.text.trim();

    setState(() {
      isLoading = true;
    });

    // Create a request model
    LoginRequestModel requestModel = LoginRequestModel(
      grantType: 'password',
      username: username,
      password: password,
    );

    // Create an API service instance
    APIService apiService = APIService();

    try {
      // Call the login API
      LoginResponseModel response = await apiService.login(requestModel);
      print('Access Token: ${response.accessToken}');
      setState(() {
        isLoading = false;
      });

      // Save access token to shared preferences
      await SharedPreferencesManager.instance
          .setString('accessToken', response.accessToken ?? '');

      // Navigate to Dashboard after successful login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Dashboard()),
      );
    } catch (e) {
      print('Login Failed: $e');
      setState(() {
        isLoading = false;
      });

      // Show login failed dialog
      _showLoginFailedDialog(context);
    }
  }

  void _showLoginFailedDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Login Failed'),
          content: const Text(
            'An error occurred during login. Please try again later.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
