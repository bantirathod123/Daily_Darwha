import 'package:flutter/material.dart';

class HelpSupportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help & Support'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Contact Us',
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(height: 16),
            Text(
              'If you have any questions or concerns, please feel free to contact us. We are here to help!',
              style: Theme.of(context).textTheme.bodyText2,
            ),
            const SizedBox(height: 24),
            _buildInquiryForm(context),
          ],
        ),
      ),
    );
  }

  Widget _buildInquiryForm(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Send us your inquiry:',
          style: Theme.of(context).textTheme.subtitle1,
        ),
        const SizedBox(height: 12),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Your Name',
            hintText: 'Enter your name',
          ),
        ),
        const SizedBox(height: 12),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Email Address',
            hintText: 'Enter your email address',
          ),
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 12),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Your Inquiry',
            hintText: 'Type your inquiry here',
          ),
          maxLines: 3,
        ),
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: () {
            // Handle form submission logic here
            _submitInquiry(context);
          },
          child: const Text('Submit Inquiry'),
        ),
      ],
    );
  }

  void _submitInquiry(BuildContext context) {
    // Implement inquiry submission logic
    // You can send the inquiry to your support email or backend service
    // Display a confirmation message to the user
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Inquiry Submitted'),
        content: const Text(
            'Thank you for contacting us! We will get back to you shortly.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
