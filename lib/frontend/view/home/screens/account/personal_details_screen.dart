import 'package:flutter/material.dart';

class PersonalDetailsScreen extends StatefulWidget {
  @override
  _PersonalDetailsScreenState createState() => _PersonalDetailsScreenState();
}

class _PersonalDetailsScreenState extends State<PersonalDetailsScreen> {
  // Fields to store user details
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTextField("Name", _nameController),
            const SizedBox(height: 20),
            _buildTextField("Email", _emailController),
            const SizedBox(height: 20),
            _buildTextField("Phone", _phoneController),
            const SizedBox(height: 20),
            _buildSaveButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _buildSaveButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Save the user details to your data store
        _saveUserDetails();
        // Optionally, navigate to another screen or perform other actions
        // Navigator.of(context).pushReplacement(...);
      },
      child: const Text('Save'),
    );
  }

  void _saveUserDetails() {
    // Perform the logic to save user details to your data store
    String name = _nameController.text;
    String email = _emailController.text;
    String phone = _phoneController.text;

    // TODO: Save the user details to your data store or perform necessary actions
    // Example: print("Name: $name, Email: $email, Phone: $phone");
  }

  @override
  void dispose() {
    // Clean up controllers when the widget is disposed
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }
}
