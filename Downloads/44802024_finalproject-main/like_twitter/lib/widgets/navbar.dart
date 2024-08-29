import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food/providers/userprovider.dart';
import 'package:go_router/go_router.dart';

class Navbar extends ConsumerWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: EdgeInsets.fromLTRB(0.0, 0, 30, 0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton.icon(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(vertical: 20, horizontal: 15)),
                  iconSize: MaterialStateProperty.all(30.0),
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.hovered)) {
                        return Color.fromARGB(255, 92, 126, 143)
                            .withOpacity(0.3); // Set the background hover color
                      } else {
                        return Colors
                            .transparent; // Set the default background color
                      }
                    },
                  ),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  )),
                ),
                onPressed: () {
                  context.go('/home');
                },
                icon: Icon(Icons.home),
                label: Text(
                  "Feed",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            TextButton.icon(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(vertical: 20, horizontal: 15)),
                  iconSize: MaterialStateProperty.all(30.0),
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.hovered)) {
                        return Colors.blueGrey
                            .withOpacity(0.3); // Set the background hover color
                      } else {
                        return Colors
                            .transparent; // Set the default background color
                      }
                    },
                  ),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  )),
                ),
                onPressed: () {
                  context.go('/myprofile');
                },
                icon: Icon(Icons.person),
                label: Text(
                  "Profile",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            TextButton.icon(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(vertical: 20, horizontal: 15)),
                  iconSize: MaterialStateProperty.all(30.0),
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.hovered)) {
                        return Colors.blueGrey
                            .withOpacity(0.3); // Set the background hover color
                      } else {
                        return Colors
                            .transparent; // Set the default background color
                      }
                    },
                  ),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  )),
                ),
                onPressed: () {
                  context.go('/edit');
                },
                icon: Icon(Icons.edit),
                label: Text(
                  "Edit Profile",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            TextButton.icon(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(vertical: 20, horizontal: 15)),
                  iconSize: MaterialStateProperty.all(30.0),
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.hovered)) {
                        return Colors.blueGrey
                            .withOpacity(0.3); // Set the background hover color
                      } else {
                        return Colors
                            .transparent; // Set the default background color
                      }
                    },
                  ),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  )),
                ),
                onPressed: () {
                  ref.read(userProvider.notifier).state = {};
                  context.go('/login');
                },
                icon: Icon(Icons.exit_to_app),
                label: Text(
                  "Logout",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                  ),
                )),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
