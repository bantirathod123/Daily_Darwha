import 'package:flutter/material.dart';

class DeliveryAddressScreen extends StatefulWidget {
  @override
  _DeliveryAddressScreenState createState() => _DeliveryAddressScreenState();
}

class _DeliveryAddressScreenState extends State<DeliveryAddressScreen> {
  // Fields to store delivery address details
  TextEditingController _houseNumberController = TextEditingController();
  TextEditingController _houseNameController = TextEditingController();
  TextEditingController _societyController = TextEditingController();
  TextEditingController _landmarkController = TextEditingController();
  TextEditingController _areaController = TextEditingController();
  TextEditingController _zipCodeController = TextEditingController();
  TextEditingController _cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delivery Address'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTextField("House Number", _houseNumberController),
            const SizedBox(height: 20),
            _buildTextField("House Name", _houseNameController),
            const SizedBox(height: 20),
            _buildTextField("Society", _societyController),
            const SizedBox(height: 20),
            _buildTextField("Landmark", _landmarkController),
            const SizedBox(height: 20),
            _buildTextField("Area", _areaController),
            const SizedBox(height: 20),
            _buildTextField("Zip Code", _zipCodeController),
            const SizedBox(height: 20),
            _buildTextField("City", _cityController),
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
        // Save the delivery address details to your data store
        _saveDeliveryAddress();
        // Optionally, navigate to another screen or perform other actions
        // Navigator.of(context).pushReplacement(...);
      },
      child: const Text('Save'),
    );
  }

  void _saveDeliveryAddress() {
    // Perform the logic to save delivery address details to your data store
    String houseNumber = _houseNumberController.text;
    String houseName = _houseNameController.text;
    String society = _societyController.text;
    String landmark = _landmarkController.text;
    String area = _areaController.text;
    String zipCode = _zipCodeController.text;
    String city = _cityController.text;

    // TODO: Save the delivery address details to your data store or perform necessary actions
    // Example: print("House Number: $houseNumber, House Name: $houseName, Society: $society, ...");
  }

  @override
  void dispose() {
    // Clean up controllers when the widget is disposed
    _houseNumberController.dispose();
    _houseNameController.dispose();
    _societyController.dispose();
    _landmarkController.dispose();
    _areaController.dispose();
    _zipCodeController.dispose();
    _cityController.dispose();
    super.dispose();
  }
}
