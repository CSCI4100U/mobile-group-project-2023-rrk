import 'package:flutter/material.dart';

class FollowingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Following Screen'),
      ),
      body: ListView.builder(
        itemCount: 5, // Adjust the number of profiles as needed
        itemBuilder: (context, index) {
          // Use your actual data for each profile
          return GestureDetector(
            onTap: () {
              // Navigate to the individual profile screen for the selected profile
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => IndividualProfileScreen(profileIndex: index)),
              );
            },
            child: ProfileListItem(
              imagePath: 'assets/images/profile_img.jpeg',
              bio: 'This is a sample bio for profile $index.',
            ),
          );
        },
      ),
    );
  }
}

class ProfileListItem extends StatelessWidget {
  final String imagePath;
  final String bio;

  ProfileListItem({required this.imagePath, required this.bio});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          // Small/round profile image on the left
          CircleAvatar(
            radius: 30.0, // Adjust the radius as needed
            backgroundImage: AssetImage(imagePath),
          ),
          SizedBox(width: 16.0),
          // Description (bio) on the right
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Profile Name', // Replace with actual profile name
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  bio,
                  style: TextStyle(fontSize: 14.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class IndividualProfileScreen extends StatelessWidget {
  final int profileIndex;

  IndividualProfileScreen({required this.profileIndex});

  @override
  Widget build(BuildContext context) {
    // Use the profileIndex to fetch the data for the individual profile
    String profileName = 'Profile Name'; // Replace with actual profile name
    String profileBio = 'This is a sample bio for profile $profileIndex.'; // Replace with actual bio

    // Simulated data for the grid
    List<String> gridImages = [
      'assets/images/demo_img.png',
      'assets/images/demo_img.png',
      'assets/images/demo_img.png',
      // Add more image paths as needed
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(profileName),
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60.0, // Adjust the radius as needed
                backgroundImage: AssetImage('assets/images/profile_img.jpeg'),
              ),
              SizedBox(height: 16.0),
              Container(
                color: Colors.white,
                padding: EdgeInsets.only(bottom: 25.0),
                child: Column(
                  children: [
                    Text(
                      profileName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.black, // Text color
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      profileBio,
                      style: TextStyle(fontSize: 16.0, color: Colors.black), // Text color
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              // Grid view below the bio
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // Adjust the number of columns as needed
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: gridImages.length,
                itemBuilder: (context, index) {
                  return Image.asset(gridImages[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
