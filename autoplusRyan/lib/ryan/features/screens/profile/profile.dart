
import 'package:autoplusRyan/ryan/features/screens/profile/change_name.dart';
import 'package:autoplusRyan/ryan/utils/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Navigate back when the back arrow is pressed
          },
        ),
        title: Text('Change Name', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/images/user.png'),
                    ),
                    TextButton(onPressed: () {}, child: const Text('Change Profile Picture')),
                  ],
                ),
              ),
              const SizedBox(height: 8.0),
              const Divider(),
              const SizedBox(height: 8.0),
              const Text('Profile Information', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8.0),
              TProfileMenu(onPressed: () => Get.to(() => ChangeName()), title: 'Name', value: 'Ryan Liu'),
              const SizedBox(height: 8.0),
              const Divider(),
              const SizedBox(height: 8.0),
              const Text('Personal Information', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8.0),
              TProfileMenu(onPressed: () {}, title: 'E-mail', value: 'Ryan.liu1@outlook.com'),
              TProfileMenu(onPressed: () {}, title: 'Phone Number', value: '+12312312311'),
              TProfileMenu(onPressed: () {}, title: 'Gender', value: 'Male'),
              TProfileMenu(onPressed: () {}, title: 'Date of Birth', value: '13 Jun, 2003'),
              const Divider(),
              const SizedBox(height: 8.0),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text('Close Account', style: TextStyle(color: Colors.red)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
