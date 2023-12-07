import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Welcome to the Help Page!',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HelpPage()),
                );
              },
              child: Text('Get Help'),
            ),
          ],
        ),
      ),
    );
  }
}

class HelpPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  Future<bool> sendEmail(String name, String email, String description) async {
    // Placeholder for email sending logic
    // Replace this with your actual email sending code
    print('Sending email to: $email');
    // Simulating a successful email sending
    return true;
  }

  @override
  Widget build(BuildContext context) {
    // Set the initial value of the email field

    emailController.text = 'your@example.com';

    return Scaffold(
      appBar: AppBar(
        title: Text('Help Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('The wait time for a response is 12 hours'),
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Full Name'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
              onTap: () {
                if (emailController.text == 'your@example.com') {
                  // Clear the pre-filled text when user taps on the field
                  emailController.clear();
                }
              },
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Description of your issue'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Handle form submission here
                print('Name: ${nameController.text}');
                print('Email: ${emailController.text}');
                print('Description: ${descriptionController.text}');

                // Simulate sending email (replace this with your actual email sending logic)
                bool emailSentSuccessfully = await sendEmail(
                  nameController.text,
                  emailController.text,
                  descriptionController.text,
                );

                // Clear text fields
                nameController.clear();
                emailController.clear();
                descriptionController.clear();

                // Close the help page
                Navigator.pop(context);

                // Show a success message to the user
                if (emailSentSuccessfully) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Email sent successfully!'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Failed to send email. Please try again.'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                }
              },
              child: Text('Send'),
            ),
          ],
        ),
      ),
    );
  }
}
