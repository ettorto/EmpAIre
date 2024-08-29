import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food/utils.dart';
import 'package:food/providers/userprovider.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends ConsumerStatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  void login(Map cred) async {
    final response = await http.post(Uri.parse('https://europe-west2-tribal-quasar-382620.cloudfunctions.net/connect-x/login'),
        body: jsonEncode(cred), headers: {'Content-Type': 'application/json'});
    print(response.body);

    ref.read(userProvider.notifier).state = jsonDecode(response.body);
    context.go('/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            'Connect X',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Center(
        child: Container(
          width: 400,
          height: 320,
          padding: const EdgeInsets.all(18.0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                        labelText: 'Email Address',
                        border: OutlineInputBorder()),
                  ),
                  SizedBox(height: 16.0),
                  TextField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(_obscurePassword
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    child: TextButton(
                      onPressed: () {
                        context.go('/');
                      },
                      child: Text("Signup?"),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      child: Text('Login'),
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 15))),
                      onPressed: () {
                        Map cred = {
                          'email': _usernameController.text,
                          'password': _passwordController.text
                        };
                        login(cred);
                        // TODO: Implement login logic
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
