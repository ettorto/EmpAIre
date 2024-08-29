import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;

final FirebaseFirestore firestore = FirebaseFirestore.instance;

// Define a function to add a new post to the "posts" collection
Future<void> addPost(String content, String author) async {
  // Get a new document reference for a new post
  final DocumentReference<Map<String, dynamic>> postRef =
      firestore.collection('posts').doc();

  // Set the data for the new post
  await postRef.set(<String, dynamic>{
    'content': content,
    'author': author,
    'timestamp': FieldValue.serverTimestamp(),
  });
}

void createProfile(Map profile) async {
  final response =
      http.post(Uri.parse('https://europe-west2-tribal-quasar-382620.cloudfunctions.net/connect-x/users'), body: jsonEncode(profile), headers: {
        'Content-Type': 'application/json'
      });
  print(response);
}




String formatFirebaseTimestamp(Timestamp timestamp) {
  DateTime date = timestamp.toDate();
  Duration difference = DateTime.now().difference(date);
  String formattedDate;

  if (difference.inDays > 7) {
    formattedDate =
        '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  } else if (difference.inDays > 0) {
    formattedDate =
        '${difference.inDays} ${difference.inDays == 1 ? 'day' : 'days'} ago';
  } else if (difference.inHours > 0) {
    formattedDate =
        '${difference.inHours} ${difference.inHours == 1 ? 'hour' : 'hours'} ago';
  } else if (difference.inMinutes > 0) {
    formattedDate =
        '${difference.inMinutes} ${difference.inMinutes == 1 ? 'minute' : 'minutes'} ago';
  } else {
    formattedDate = 'just now';
  }

  return formattedDate;
}
