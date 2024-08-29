

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food/utils.dart';
import 'package:food/widgets/feed_input.dart';
import 'package:food/widgets/navbar.dart';
import 'package:food/widgets/post_card.dart';
import 'package:http/http.dart' as http;

class Layout extends ConsumerStatefulWidget {
  const Layout({Key? key}) : super(key: key);

  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends ConsumerState<Layout> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // const Spacer(),
        // const Spacer(),
        const Flexible(flex: 2, child: Navbar()),
        Container(
          width: 900,
          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.white,
                title: Text(
                  'Feed',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              SliverToBoxAdapter(
                child: SocialMediaTextInput(
                  onPost: (postContent, email) async {
                    addPost(postContent, email);
                    print("clicked");
                    await http.get(
                        Uri.parse(
                            'https://us-central1-tribal-quasar-382620.cloudfunctions.net/email'),
                        headers: {'Content-Type': 'application/json'});
                  },
                ),
              ),
              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('posts')
                    .orderBy('timestamp', descending: true)
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return SliverFillRemaining(
                      child: Center(
                        child: Text('Error: ${snapshot.error}'),
                      ),
                    );
                  }

                  if (!snapshot.hasData) {
                    return SliverFillRemaining(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }

                  final List<Object?> posts =
                      snapshot.data!.docs.map((doc) => doc.data()).toList();

                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final post = posts[index] as Map;
                        return SocialMediaPostCard(
                          timeAgo: post['timestamp'] != null
                              ? post['timestamp']
                              : Timestamp(0, 0),
                          name: post['author'],
                          postContent: post['content'] as String,
                          username: post['author'] as String,
                        );
                      },
                      childCount: posts.length,
                    ),
                  );
                },
              ),
            ],
          ),
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                width: 0.5,
                color: const Color.fromARGB(118, 158, 158, 158),
              ),
              right: BorderSide(
                width: 0.5,
                color: const Color.fromARGB(118, 158, 158, 158),
              ),
            ),
          ),
        ),
        // const Spacer(),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 100),
          child: Center(
              child: Image(
            width: 50,
            image: NetworkImage(
                'https://th.bing.com/th/id/OIP.iytI8VgxWFQO8su707rBUQHaGH?pid=ImgDet&rs=1'),
          )),
        )
      ],
    );
  }
}
