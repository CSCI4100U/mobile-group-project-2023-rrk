import 'package:chat_app/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'message.dart';

class ChatPage extends StatefulWidget {
  String email;

  // Constructor for receiving the email
  ChatPage({required this.email});

  @override
  _ChatPageState createState() => _ChatPageState(email: email);
}

class _ChatPageState extends State<ChatPage> {
  String email;

  // Constructor for initializing the email
  _ChatPageState({required this.email});

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat App'),
        actions: [
          // Button for signing out
          MaterialButton(
            onPressed: () {
              _auth.signOut().whenComplete(() {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Home(),
                  ),
                );
              });
            },
            child: Text("Sign Out"),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Widget for displaying messages
            Container(
              height: MediaQuery.of(context).size.height * 0.79,
              child: messages(email: email),
            ),
            // Input field for typing messages
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: messageController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.red[100],
                      hintText: 'Type a message',
                      contentPadding: const EdgeInsets.only(
                          left: 14.0, bottom: 8.0, top: 8.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                // Button for sending messages
                IconButton(
                  onPressed: () {
                    if (messageController.text.isNotEmpty) {
                      _firestore.collection('Messages').doc().set({
                        'message': messageController.text.trim(),
                        'time': DateTime.now(),
                        'email': email,
                      });

                      messageController.clear();
                    }
                  },
                  icon: Icon(Icons.send_sharp),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
