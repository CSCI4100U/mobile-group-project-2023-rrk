import 'package:flutter/material.dart';

class FavouritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourites Screen'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // You can adjust the number of columns here
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: 6, // Adjust the number of items as needed
        itemBuilder: (context, index) {
          // Use your actual data for each listing
          return ListingCard(imagePath: 'assets/images/demo_img.png');
        },
      ),
    );
  }
}

class ListingCard extends StatelessWidget {
  final String imagePath;

  ListingCard({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            imagePath,
            fit: BoxFit.cover,
            height: 120.0, // Adjust the height as needed
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Listing Title', // Replace with actual listing title
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
