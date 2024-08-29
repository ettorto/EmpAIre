
import 'package:flutter/material.dart';

class SocialMediaProfile extends StatelessWidget {
  final String name;
  final String handle;
  final String email;
  final String residence;
  final String major;
  final String dob;
  final String bestMovie;
  final String bestFood;

  SocialMediaProfile(
      {required this.name,
      required this.handle,
      required this.email,
      required this.residence,
      required this.major,
      required this.dob,
      required this.bestMovie,
      required this.bestFood});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          SizedBox(height: 20.0),
          CircleAvatar(
            radius: 50.0,
            backgroundImage:
                NetworkImage('https://i.stack.imgur.com/l60Hf.png'),
          ),
          SizedBox(height: 20.0),
          Container(
            child: Text(
              name,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.account_circle, color: Colors.grey, size: 16.0),
                SizedBox(width: 5.0),
                Text(
                  '@$handle',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.0),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.location_on, color: Colors.grey, size: 16.0),
                SizedBox(width: 5.0),
                Text(
                  residence,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.0),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.school, color: Colors.grey, size: 16.0),
                SizedBox(width: 5.0),
                Text(
                  major,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.0),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.calendar_today, color: Colors.grey, size: 16.0),
                SizedBox(width: 5.0),
                Text(
                  dob,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.0),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.local_movies, color: Colors.grey, size: 16.0),
                SizedBox(width: 5.0),
                Text(
                  bestMovie,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.0),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.fastfood, color: Colors.grey, size: 16.0),
                SizedBox(width: 5.0),
                Text(
                  bestFood,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
