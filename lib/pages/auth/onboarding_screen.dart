import 'package:expanse_tracker/pages/auth/login_screen.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  static const String routeName = "Boarding_Screen";

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  void _nextPage() {
    if (_currentIndex < 2) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, LoginScreen.routeName);
            },
            child: Text(
              'Skip',
              style: TextStyle(color: Colors.blue, fontSize: 16),
            ),
          )
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: [
          _buildPage(
            image: 'assets/images/wallet.png',
            title: 'Welcome to Expendi',
            description:
                'Take Charge of Your Spending Effortlessly and Track Your Expenses',
          ),
          _buildPage(
            image: 'assets/images/bar.png',
            title: 'Take Control of Your Finances',
            description:
                'Track, Manage, and Analyze Your Expenses with Ease and like a Pro',
          ),
          _buildPage(
            image: 'assets/images/security.png',
            title: 'Your Data is Secure',
            description:
                'Peace of Mind with Secure Data Protection, We Prioritize Your Privacy',
          ),
        ],
      ),
      bottomSheet: _buildBottomSheet(),
    );
  }

  Widget _buildPage(
      {required String image,
      required String title,
      required String description}) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image, height: 250),
          SizedBox(height: 30),
          Text(
            title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 15),
          Text(
            description,
            style: TextStyle(fontSize: 16, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              3,
              (index) => Container(
                margin: EdgeInsets.all(4),
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == index
                      ? Colors.blue.shade900
                      : Colors.blue.shade200,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomSheet() {
    // return TextButton(
    //   onPressed: () {
    //     _pageController.jumpToPage(2);
    //   },
    //   child: Text('Skip'),
    // );
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 35, horizontal: 12),
      child: ElevatedButton(
        onPressed: _nextPage,
        child: Text(_currentIndex == 2 ? 'Get Started' : 'Next'),
      ),
    );
  }
}
