import 'package:flutter/material.dart';
import 'package:login_api/frontend/view/home/screens/bottom_nav/account_screen.dart';
import 'package:login_api/frontend/view/home/screens/bottom_nav/home_screen.dart';
import 'package:login_api/frontend/view/home/screens/bottom_nav/products_screen.dart';
import 'package:login_api/frontend/view/home/screens/bottom_nav/subscription_screen.dart';
import 'package:login_api/frontend/view/home/screens/bottom_nav/wallets_screen.dart';
import 'package:login_api/frontend/view/home/screens/drawer_nav/drawer_header.dart';
import 'package:login_api/frontend/view/home/screens/widgets/ShoppingBagState.dart';
import 'package:login_api/frontend/view/home/screens/widgets/SubscriptionState.dart';
import 'package:provider/provider.dart';

import '../../models/Product_model.dart';
import 'screens/widgets/app_bar/notification_icon_widget.dart';
import 'screens/widgets/app_bar/shopping_bag_icon_widget.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;
  late List<Widget> _pages;
  String username = 'Banti';
  late Product myProduct; // Modify to late initialization

  @override
  void initState() {
    myProduct = Product(name: '', imagePath: '', quantity: '', price: 0.0);

    // Initialize myProduct here
    _pages = [
      HomeClass(), // HomePage
      const ProductsClass(), // Products
      WalletClass(
        product: myProduct,
        selectedSchedule: '',
        selectedQuantity: 0,
        selectedDate: null,
      ), // Wallet
      SubscriptionClass(
        product: myProduct,
        selectedSchedule: '',
        selectedQuantity: 0,
        selectedDate: null,
      ), // Subscription
      const AccountClass(), // Account
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SubscriptionState()),
        ChangeNotifierProvider(create: (context) => ShoppingBagState()),
        // Add other providers if needed
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Sid's Farm"),
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {
                // Handle Notification Icon Tap
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Notifications(),
                  ),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.shopping_bag),
              onPressed: () {
                // Handle Shopping Bag Icon Tap
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ShoppingBag(), // Include ShoppingBag widget here
                  ),
                );
              },
            ),
          ],
        ),
        drawer: _buildDrawer(),
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Onetime',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet),
              label: 'Wallet',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.subscriptions),
              label: 'Cycle',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Account',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: Column(
        children: [
          CustomDrawerHeader(username: username),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildListTile('Home', Icons.home, () => _navigateTo('Home')),
                _buildListTile('My Subscription', Icons.subscriptions,
                    () => _navigateTo('My Subscription')),
                _buildListTile('Refer and Earn', Icons.people,
                    () => _navigateTo('Refer and Earn')),
                _buildListTile('Order History', Icons.history,
                    () => _navigateTo('Order History')),
                _buildListTile('Holidays', Icons.calendar_today,
                    () => _navigateTo('Holidays')),
                _buildListTile(
                    'Offers', Icons.local_offer, () => _navigateTo('Offers')),
                _buildListTile(
                    'Quality', Icons.star, () => _navigateTo('Quality')),
                _buildListTile(
                    "FAQ's", Icons.question_answer, () => _navigateTo("FAQ's")),
                _buildListTile('Help & Support', Icons.help,
                    () => _navigateTo('Help & Support')),
                _buildListTile(
                    'Policies', Icons.policy, () => _navigateTo('Policies')),
                ListTile(
                  title: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                    child: Row(
                      children: [
                        const Text('Pause all deliveries'),
                        const Spacer(),
                        Switch(
                          value: true,
                          onChanged: (value) {
                            // Handle toggle change
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListTile(String title, IconData icon, VoidCallback onTap) {
    return ListTile(
      title: Text(title),
      leading: Icon(icon),
      onTap: onTap,
    );
  }

  void _navigateTo(String destination) {
    switch (destination) {
      case 'Home':
        Navigator.pushNamed(context, '/home');
        break;
      case 'My Subscription':
        // Navigate to Subscription Screen
        break;
      // Other cases for different destinations
      default:
        break;
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
