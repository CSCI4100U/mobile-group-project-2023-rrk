
import 'package:autoplusRyan/ryan/features/screens/profile/FavouriteScreen.dart';
import 'package:autoplusRyan/ryan/features/screens/profile/FollowingScreen.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Navigate back when the back arrow is pressed
          },
        ),
        backgroundColor: Color.fromARGB(255, 255, 123, 0), // Set the background color of the AppBar
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 255, 123, 0),
                    Color.fromARGB(255, 255, 123, 0),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.center,
                ),
              ),
            ),
            Scaffold(
              backgroundColor: Colors.transparent,
              body: Container(
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.only(top: _height / 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            CircleAvatar(
                              backgroundImage: const AssetImage('assets/images/user.png'),
                              radius: _height / 10,
                            ),
                            SizedBox(
                              height: _height / 30,
                            ),
                            Text(
                              'Ryan Liu',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: _height / 2.2),
                      child: Container(
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: _height / 2.6,
                        left: _width / 20,
                        right: _width / 20,
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black45,
                                  blurRadius: 2.0,
                                  offset: Offset(0.0, 2.0),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(_width / 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  headerChild('Favourites', 6),
                                  headerChild('Following', 36),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: _height / 20),
                            child: Column(
                              children: <Widget>[
                                infoChild(_width, Icons.email, 'name@gmail.com'),
                                infoChild(_width, Icons.call, '1231231231'),
                                infoChild(_width, Icons.chat_bubble, 'Show all comments'),
                                Padding(
                                  padding: EdgeInsets.only(top: _height / 30),
                                  child: Container(
                                    width: _width / 3,
                                    height: _height / 20,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 255, 123, 0),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(_height / 40),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black87,
                                          blurRadius: 2.0,
                                          offset: Offset(0.0, 1.0),
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: Text(
                                        'CONTACT ME',
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

Widget headerChild(String header, int value) => Expanded(
  child: InkWell(
    onTap: () {
      if (header == 'Following') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FollowingScreen()),
        );
      } else if (header == 'Favourites') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FavouritesScreen()),
        );
      }
    },
    child: Column(
      children: <Widget>[
        Text(header),
        SizedBox(
          height: 8.0,
        ),
        Text(
          '$value',
          style: TextStyle(
            fontSize: 14.0,
            color: Color.fromARGB(255, 255, 123, 0),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  ),
);

  Widget infoChild(double width, IconData icon, data) => Padding(
        padding: EdgeInsets.only(bottom: 8.0),
        child: InkWell(
          child: Row(
            children: <Widget>[
              SizedBox(
                width: width / 10,
              ),
              Icon(
                icon,
                color: Color.fromARGB(255, 255, 123, 0),
                size: 36.0,
              ),
              SizedBox(
                width: width / 20,
              ),
              Text(data),
            ],
          ),
          onTap: () {
            print('Info Object selected');
          },
        ),
      );
}
