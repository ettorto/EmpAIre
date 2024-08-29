// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';

// class SocialMediaTextInput extends StatefulWidget {
//   final Function(String) onPost;

//   SocialMediaTextInput({required this.onPost});

//   @override
//   _SocialMediaTextInputState createState() => _SocialMediaTextInputState();
// }

// class _SocialMediaTextInputState extends State<SocialMediaTextInput> {
//   final TextEditingController _textController = TextEditingController();

//   bool _canPost = false;

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 0.0,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             CircleAvatar(
//               backgroundImage: NetworkImage(
//                   "https://pbs.twimg.com/profile_images/1352844693151731713/7Gt9XsTf_normal.jpg"),
//             ),
//             SizedBox(width: 10.0),
//             Expanded(
//               child: TextField(
//                 controller: _textController,
//                 decoration: InputDecoration(
//                   hintText: "What's happening?",
//                   border: InputBorder.none,
//                 ),
//                 onChanged: (text) {
//                   setState(() {
//                     _canPost = text.trim().isNotEmpty;
//                   });
//                 },
//                 maxLines: null,
//               ),
//             ),
//             SizedBox(width: 10.0),
//             ElevatedButton(
//               onPressed: _canPost
//                   ? () {
//                       widget.onPost(_textController.text.trim());
//                       _textController.clear();
//                       setState(() {
//                         _canPost = false;
//                       });

                      
//                     }
//                   : null,
//               child: Text("Post"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food/providers/userprovider.dart';

class SocialMediaTextInput extends ConsumerStatefulWidget {
  final Function(String, String) onPost;

  SocialMediaTextInput({required this.onPost});

  @override
  _SocialMediaTextInputState createState() => _SocialMediaTextInputState();
}

class _SocialMediaTextInputState extends ConsumerState<SocialMediaTextInput> {
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  bool _canPost = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://pbs.twimg.com/profile_images/1352844693151731713/7Gt9XsTf_normal.jpg"),
            ),
            SizedBox(width: 10.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                      hintText: "What's happening?",
                      border: InputBorder.none,
                    ),
                    onChanged: (text) {
                      setState(() {
                        _canPost = text.trim().isNotEmpty;
                      });
                    },
                    maxLines: null,
                  ),
                  // TextField(
                  //   controller: _emailController,
                  //   decoration: InputDecoration(
                  //     hintText: "Enter your email",
                  //     border: InputBorder.none,
                  //   ),
                  //   maxLines: null,
                  // ),
                ],
              ),
            ),
            SizedBox(width: 10.0),
            ElevatedButton(
              onPressed: _canPost
                  ? () {
                      widget.onPost(
                        _textController.text.trim(),
                         ref.watch(userProvider)['email']
                      );
                      _textController.clear();
                      _emailController.clear();
                      setState(() {
                        _canPost = false;
                      });
                    }
                  : null,
              child: Text("Post"),
            ),
          ],
        ),
      ),
    );
  }
}