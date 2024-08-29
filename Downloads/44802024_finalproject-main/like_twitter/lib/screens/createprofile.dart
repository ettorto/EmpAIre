import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food/utils.dart';
import 'package:go_router/go_router.dart';

class CreateProfilePage extends StatefulWidget {
  @override
  _CreateProfilePageState createState() => _CreateProfilePageState();
}

class _CreateProfilePageState extends State<CreateProfilePage> {
  final _formKey = GlobalKey<FormState>();

  String _studentId = '';
  String _name = '';
  String _email = '';
  String _yearGroup = '';
  String _major = '';

 final TextEditingController _studentIdController = TextEditingController();
 final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _yearGroupController = TextEditingController();
  final TextEditingController _majorController = TextEditingController();
  final TextEditingController _favoriteMovieController = TextEditingController();
  final TextEditingController _residenceController = TextEditingController();
  final TextEditingController _favoriteFoodController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(33, 150, 243, 1),
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Center(
            child: Text('Connect X', style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold
            ),),
          ),
        ),
        body: Center(
          child: Container(
            width: 500,
            height: 530,
            padding: const EdgeInsets.all(18.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      child: Text(
                        "Register an account",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      controller: _studentIdController,
                      decoration: InputDecoration(
                          labelText: 'Student ID Number',
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your student ID number';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _studentId = value!;
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 15),
                    child: TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                          labelText: 'Name', border: OutlineInputBorder()),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _name = value!;
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 15),
                    child: TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                          labelText: 'Email', border: OutlineInputBorder()),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _email = value!;
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 15),
                    child: TextFormField(
                      controller: _yearGroupController,
                      decoration: InputDecoration(
                          labelText: 'Year Group',
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your year group';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _yearGroup = value!;
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 15),
                    child: TextFormField(
                      controller: _majorController,
                      decoration: InputDecoration(
                          labelText: 'Major', border: OutlineInputBorder()),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your major';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _major = value!;
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 15),
                    child: TextFormField(
                      controller: _dobController,
                      decoration: InputDecoration(
                          labelText: 'Date of birth',
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your date of birth';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _major = value!;
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 15),
                    child: TextFormField(
                      controller: _favoriteMovieController,
                      decoration: InputDecoration(
                          labelText: 'Favorite Movie',
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your favorite movie';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _major = value!;
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 15),
                    child: TextFormField(
                      controller: _residenceController,
                      decoration: InputDecoration(
                          labelText: 'Residence (On/Off campus)',
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your residence';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _major = value!;
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 15),
                    child: TextFormField(
                      controller: _favoriteFoodController,
                      decoration: InputDecoration(
                          labelText: 'Favorite Food',
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your favorite food';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _major = value!;
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 15),
                    child: TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                          labelText: 'Password', border: OutlineInputBorder()),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _major = value!;
                      },
                    ),
                  ),
                  SizedBox(
                    child: TextButton(
                      onPressed: () {
                        context.go('/login');
                      },
                      child: Text("Login?"),
                    ),
                  ),
                  SizedBox(height: 20,),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 15))),
                      child: Text('Submit'),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          // Do something with the user's input
                        }
                        Map profile = {
                          'student_id': _studentIdController.text,
                          'email': _emailController.text,
                          'name': _nameController.text,
                          'dob': _dobController.text,
                          'year_group': _yearGroupController.text,
                          'major': _majorController.text,
                          'residence': _residenceController.text,
                          'best_food': _favoriteFoodController.text,
                          'best_movie': _favoriteMovieController.text,
                          'password': _passwordController.text
                        };
                        createProfile(profile);
                        context.go('/login');
                        // FirebaseFirestore.instance.collection('users').add({
                        //   'studentId': _studentIdController.text,
                        //   'name': _nameController.text,
                        //   'email': _emailController.text,
                        //   'yearGroup': _yearGroupController.text,
                        //   'major': _majorController.text,
                        //   'favoriteMovie': _favoriteMovieController.text,
                        //   'residence': _residenceController.text,
                        //   'favoriteFood': _favoriteFoodController.text,
                        // }).then((value) {
                        //   print("User added with ID: ${value.id}");
                        // }).catchError((error) {
                        //   print("Failed to add user: $error");
                        // });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
