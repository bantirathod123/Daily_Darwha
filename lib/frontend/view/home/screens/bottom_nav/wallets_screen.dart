import 'package:flutter/material.dart';
import 'package:login_api/frontend/view/home/screens/bottom_nav/subscription_screen.dart';

// Assume you have a Wallet class to manage the wallet balance
class Wallet {
  double _balance = 0.0;

  // Method to check wallet balance
  double checkWalletBalance() {
    return _balance;
  }

  // Method to update wallet balance
  void updateWalletBalance(double amount) {
    _balance += amount;
    // Add logic here for updating the balance in your database or storage
  }
}

class WalletClass extends StatelessWidget {
  final dynamic product;
  final String selectedSchedule;
  final int selectedQuantity;
  final DateTime? selectedDate;

  const WalletClass({
    super.key,
    required this.product,
    required this.selectedSchedule,
    required this.selectedQuantity,
    required this.selectedDate,
  });

  @override
  Widget build(BuildContext context) {
    // Create an instance of the Wallet class
    Wallet wallet = Wallet();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Wallets'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Your Balance
            const Text(
              'Your Balance',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Rs 0.00', // Replace with the actual balance value
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20), // Adjust spacing as needed

            // Recharge Amount
            const TextField(
              decoration: InputDecoration(
                labelText: 'Recharge Amount',
                prefixText: 'Rs ',
              ),
              keyboardType: TextInputType.number,
              // Handle the input and update the recharge amount value
              // Example: onChanged: (value) => updateRechargeAmount(value),
            ),
            const SizedBox(height: 20), // Adjust spacing as needed

            // Choose Payment Mode
            const Text(
              'Choose Payment Mode',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildPaymentModeButton('UPI'),
                _buildPaymentModeButton('Credit'),
                _buildPaymentModeButton('Debit'),
                // Add more payment modes as needed
              ],
            ),
            const SizedBox(height: 20), // Adjust spacing as needed

            // Pay Button
            _buildPayButton(context, wallet),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentModeButton(String mode) {
    return ElevatedButton(
      onPressed: () {
        // Handle payment mode selection
        // Example: updateSelectedPaymentMode(mode);
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(mode),
    );
  }

  Widget _buildPayButton(BuildContext context, Wallet wallet) {
    return ElevatedButton(
      onPressed: () {
        // Process payment or add money to the wallet
        // Update the wallet balance
        double rechargeAmount = 50.0; // Replace with the actual recharge amount
        wallet.updateWalletBalance(rechargeAmount); // Update wallet balance

        // After successful payment, navigate back to SubscriptionScreen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => SubscriptionClass(
              product: product,
              selectedSchedule: selectedSchedule,
              selectedQuantity: selectedQuantity,
              selectedDate: selectedDate,
            ),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.yellow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'Pay',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
