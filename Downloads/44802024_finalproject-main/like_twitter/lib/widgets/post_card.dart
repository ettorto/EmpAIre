import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food/utils.dart';

class SocialMediaPostCard extends StatelessWidget {
  final String name;
  final String username;
  final String postContent;
  // final String profileImageUrl;
  // final String postImageUrl;
  final Timestamp timeAgo;

  SocialMediaPostCard({
    required this.name,
    required this.username,
    required this.postContent,
    // required this.profileImageUrl,
    // required this.postImageUrl,
    required this.timeAgo,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(''),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "@" + username + " · " + formatFirebaseTimestamp(timeAgo),
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
            child: Text(
              postContent,
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildButton(IconData icon, String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          children: <Widget>[
            Icon(icon),
            SizedBox(width: 4.0),
            Text(label),
          ],
        ),
      ),
    );
  }
}