import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food/providers/userprovider.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

class EditProfileForm extends ConsumerStatefulWidget {
  const EditProfileForm({Key? key}) : super(key: key);

  @override
  _EditProfileFormState createState() => _EditProfileFormState();
}

class _EditProfileFormState extends ConsumerState<EditProfileForm> {
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _email = '';
  String _password = '';

  // TextEditingController _yearGroupController = TextEditingController();
  TextEditingController _majorController = TextEditingController();
  TextEditingController _favoriteMovieController = TextEditingController();
  TextEditingController _residenceController = TextEditingController();
  TextEditingController _favoriteFoodController = TextEditingController();

  void editProfile(Map profile) async {
    final response = await http.put(
        Uri.parse('https://europe-west2-tribal-quasar-382620.cloudfunctions.net/connect-x/users/${profile['student_id']}'),
        body: jsonEncode(profile),
        headers: {'Content-Type': 'application/json'});
    print(response.body);
    ref.read(userProvider.notifier).state = jsonDecode(response.body);
    context.go('/myprofile');
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 600,
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Edit Your Profile',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  enabled: false,
                  labelText:
                      'Student Id: ${ref.watch(userProvider)['student_id']}',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
                onSaved: (value) {
                  _username = value!;
                },
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                decoration: InputDecoration(
                  enabled: false,
                  labelText: 'Name: ${ref.watch(userProvider)['name']}',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
                onSaved: (value) {
                  _username = value!;
                },
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'DOB: ${ref.watch(userProvider)['dob']}',
                    enabled: false),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
                onSaved: (value) {
                  _username = value!;
                },
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: _majorController,
                decoration: InputDecoration(
                    labelText: 'Major: ${ref.watch(userProvider)['major']}'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
                onSaved: (value) {
                  _username = value!;
                },
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: _favoriteFoodController,
                decoration: InputDecoration(
                  labelText:
                      'Favourite Food : ${ref.watch(userProvider)['best_food']}',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
                onSaved: (value) {
                  _username = value!;
                },
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: _residenceController,
                decoration: InputDecoration(
                    labelText:
                        'Residence: ${ref.watch(userProvider)['residence']}'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
                onSaved: (value) {
                  _username = value!;
                },
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: _favoriteMovieController,
                decoration: InputDecoration(
                  labelText:
                      'Favourite Movie: ${ref.watch(userProvider)['best_movie']}',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                onSaved: (value) {
                  _email = value!;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // Do something with the form data
                    }
                    Map profile = {
                      'student_id': ref.watch(userProvider)['student_id'],
                      'major': _majorController.text,
                      'best_food': _favoriteFoodController.text,
                      'residence': _residenceController.text,
                      'best_movie': _favoriteMovieController.text
                    };
    
                    editProfile(profile);
    
                    // context.go('/myprofile');
                  },
                  child: const Text('Save'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
