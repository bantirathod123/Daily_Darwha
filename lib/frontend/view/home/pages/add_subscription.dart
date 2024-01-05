import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/Product_model.dart';
import '../screens/bottom_nav/subscription_screen.dart';
import '../screens/bottom_nav/wallets_screen.dart';
import '../screens/widgets/SubscriptionState.dart';

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

class AddSubscription extends StatefulWidget {
  final Product product;

  const AddSubscription({super.key, required this.product});

  @override
  _AddSubscriptionState createState() => _AddSubscriptionState();
}

class _AddSubscriptionState extends State<AddSubscription> {
  DateTime? _selectedDate;
  int _selectedQuantity = 1;
  String _selectedSchedule = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Subscription'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Product: ${widget.product.name}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Image.asset(
                    widget.product.imagePath,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Name: ${widget.product.name}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Quantity: ${widget.product.quantity}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const SizedBox(height: 10),
                      Text(
                        '\$${widget.product.price.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Choose Schedule:',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Radio(
                      value: 'Daily',
                      groupValue: _selectedSchedule,
                      onChanged: (value) {
                        setState(() {
                          _selectedSchedule = value.toString();
                        });
                      },
                    ),
                    const Text('Daily'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: 'Alternate',
                      groupValue: _selectedSchedule,
                      onChanged: (value) {
                        setState(() {
                          _selectedSchedule = value.toString();
                        });
                      },
                    ),
                    const Text('Alternate'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: 'Custom',
                      groupValue: _selectedSchedule,
                      onChanged: (value) {
                        setState(() {
                          _selectedSchedule = value.toString();
                        });
                      },
                    ),
                    const Text('Custom'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Quantity:',
                  style: TextStyle(fontSize: 16),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (_selectedQuantity > 1) _selectedQuantity--;
                        });
                      },
                      icon: const Icon(Icons.remove),
                    ),
                    Text(
                      '$_selectedQuantity',
                      style: const TextStyle(fontSize: 16),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _selectedQuantity++;
                        });
                      },
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Choose Start Date:',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: () async {
                    await _selectDate(context);
                  },
                  child: Row(
                    children: [
                      const Icon(Icons.calendar_today),
                      const SizedBox(width: 8),
                      Text(
                        _selectedDate != null
                            ? '${_selectedDate!.day}-${_selectedDate!.month}-${_selectedDate!.year}'
                            : 'Select Date',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          SubscriptionState subscriptionState =
              Provider.of<SubscriptionState>(context, listen: false);

          String subscriptionDetails =
              '${widget.product.name} - Schedule: $_selectedSchedule, Quantity: $_selectedQuantity, Date: ${_selectedDate != null ? _selectedDate!.toString() : 'Not Selected'}';

          subscriptionState.addSubscription(subscriptionDetails);

          Wallet wallet = Wallet();
          double requiredAmount = 0.0;

          bool hasSufficientBalance =
              wallet.checkWalletBalance() >= requiredAmount;

          if (hasSufficientBalance) {
            _addSubscription();
          } else {
            _navigateToWalletForRecharge();
          }
        },
        label: const Text('Add Subscription'),
        icon: const Icon(Icons.add),
        backgroundColor: Colors.yellow,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void _addSubscription() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => SubscriptionClass(
          key: UniqueKey(), // Consider passing a unique key if needed
          product: widget.product,
          selectedSchedule: _selectedSchedule,
          selectedQuantity: _selectedQuantity,
          selectedDate: _selectedDate,
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(
        DateTime.now().year + 10,
      ),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  Future<void> _navigateToWalletForRecharge() async {
    final Wallet wallet = Wallet();
    double requiredAmount = 0.0;

    if (wallet.checkWalletBalance() >= requiredAmount) {
      _addSubscription();
    } else {
      final result = await Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => WalletClass(
            product: widget.product,
            selectedSchedule: _selectedSchedule,
            selectedQuantity: _selectedQuantity,
            selectedDate: _selectedDate,
          ),
        ),
      );

      if (result == true) {
        _addSubscription();
      }
    }
  }
}
