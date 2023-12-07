
import 'package:autoplusRyan/ryan/features/screens/profile/UserProfile.dart';
import 'package:autoplusRyan/ryan/utils/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import '../screens/profile/profile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// -- Header
            TPrimaryHeaderContainer(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// -- Header
                  TAppBar(
                    showBackArrowIcon: true,
                    title: Text(
                      'Account',
                      style: Theme.of(context).textTheme.headlineMedium!.apply(color: TColors.white),
                    ),
                  ),
                  TUserProfileCard(
                    user: TDummyData.user,
                    actionButtonOnPressed: () => Get.to(() => const ProfileScreen()),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),

            /// -- Profile Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// -- Account  Settings
                  const TSectionHeading(title: 'Account Settings'),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  TSettingsMenu(
                    icon: Icons.person,
                    title: 'My Profile',
                    subTitle: 'View your profile',
                    onPressed: () => Get.to(() => UserProfile()),  // Navigate to UserProfileScreen
                  ),

                  TSettingsMenu(
                    icon: Icons.notifications,
                    title: 'Notifications',
                    subTitle: 'Set any kind of notification message',
                    onPressed: () {},
                    trailing: Switch(
                      value: true,  // Set the initial value for the toggle
                      onChanged: (value) {
                        // Handle the toggle state change
                        // You can implement logic to enable/disable notifications here
                      },
                    ),
                  ),

                  /// -- Logout Button
                  const SizedBox(height: TSizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(onPressed: () {}, child: const Text('Logout')),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections * 2.5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
