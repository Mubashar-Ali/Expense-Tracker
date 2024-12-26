// OTP Screen
import 'package:expanse_tracker/pages/survey/survery_screen.dart';
import 'package:flutter/material.dart';

class OTPScreen extends StatelessWidget {
  final TextEditingController otpController = TextEditingController();
  static const routeName = "OTP_Screen";

  OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text('Enter OTP'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Enter the OTP sent to your phone',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: otpController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'OTP',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                prefixIcon: const Icon(Icons.lock),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle OTP submission
                  Navigator.pushNamed(context, SurveyFlow.routeName);
                },
                style: ElevatedButton.styleFrom(),
                child: const Text(
                  'Verify OTP',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
