import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Onboarding Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const OnboardingPage(),
    );
  }
}

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          OnboardScreen1(
            onNext: () {
              _navigateToNextPage(context);
            },
          ),
          OnboardScreen2(
            onSkip: () {
              Navigator.of(context).pop(); // Close the onboarding
            },
            onNext: () {
              _navigateToNextPage(context);
            },
          ),
          OnboardScreen3(
            onGotIt: () {
              Navigator.of(context).pop(); // Close the onboarding
            },
          ),
        ],
      ),
    );
  }

  void _navigateToNextPage(BuildContext context) {
    _pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.ease);
  }
}

class OnboardScreen1 extends StatelessWidget {
  final VoidCallback onNext;

  const OnboardScreen1({
    Key? key,
    required this.onNext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Column(
              children: [
                FaIcon(
                  FontAwesomeIcons.car,
                  size: 40,
                  color: Colors.red,
                ),
                Text(
                  'AUTO+',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color:Colors.red),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Text('Welcome to AUTO+, your one-stop shop for buying and selling vehicles.'),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: onNext,
            child: Text('Next'),
          ),
        ],
      ),
    );
  }
}

class OnboardScreen2 extends StatelessWidget {
  final VoidCallback onSkip;
  final VoidCallback onNext;

  const OnboardScreen2({
    Key? key,
    required this.onSkip,
    required this.onNext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Column(
              children: [
                Text(
                  'BUY',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color:Colors.red),
                ),
                SizedBox(height: 16),
                Image.asset(
                  'images/buy.png',
                  width: 200, // Adjust the width as needed
                  height: 200, // Adjust the height as needed
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Text('Browse our extensive collection of vehicles and find the perfect one for you.'),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: onSkip,
                child: Text('Skip'),
              ),
              ElevatedButton(
                onPressed: onNext,
                child: Text('Next'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class OnboardScreen3 extends StatelessWidget {
  final VoidCallback onGotIt;

  const OnboardScreen3({
    Key? key,
    required this.onGotIt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Text(
              'SELL',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color:Colors.red),
            ),
          ),
          SizedBox(height: 16),
          Image.asset(
            'images/sale-dealer.png',
            width: 200, // Adjust the width as needed
            height: 200, // Adjust the height as needed
          ),
          Text('Ready to sell your vehicle? List it on AUTO+ and connect with potential buyers.'),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: onGotIt,
                child: Text('Got it'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle login action
                },
                child: Text('Login'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
