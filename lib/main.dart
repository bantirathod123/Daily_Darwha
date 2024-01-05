import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'frontend/view/auth/login_screen.dart';
import 'frontend/view/home/dashboard.dart';
import 'frontend/view/home/screens/splash/splash_screen.dart';
import 'frontend/view/home/screens/widgets/ShoppingBagState.dart';
import 'frontend/view/home/screens/widgets/app_bar/shopping_bag_icon_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    runApp(
      ChangeNotifierProvider.value(
        value: ShoppingBagState(),
        child: MyApp(isLoggedIn: isLoggedIn),
      ),
    );
  } catch (error) {
    print('Initialization error: $error');
  }
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({Key? key, required this.isLoggedIn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: isLoggedIn ? const Dashboard() : const SplashScreen(),
      routes: {
        '/login': (BuildContext context) => const LoginPage(),
        '/shoppingBag': (BuildContext context) => const ShoppingBag(),
      },
    );
  }
}
