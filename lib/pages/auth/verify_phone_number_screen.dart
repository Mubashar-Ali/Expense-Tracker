// Verify Phone Number Screen
import 'package:expanse_tracker/pages/auth/otp_screen.dart';
import 'package:flutter/material.dart';

class VerifyPhoneNumberScreen extends StatelessWidget {
  final TextEditingController phoneController = TextEditingController();
  static const routeName = "Verify_Phone_Screen";

  VerifyPhoneNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text('Verify Phone Number'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Enter your phone number',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                prefixIcon: const Icon(Icons.phone),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle phone number submission
                  Navigator.pushNamed(context, OTPScreen.routeName);
                },
                style: ElevatedButton.styleFrom(),
                child: const Text(
                  'Send OTP',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
