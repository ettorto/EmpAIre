import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food/providers/userprovider.dart';
import 'package:food/widgets/edit_form.dart';
import 'package:food/widgets/feed_input.dart';
import 'package:food/widgets/navbar.dart';
import 'package:food/widgets/post_card.dart';
import 'package:food/widgets/profile_card.dart';
import 'package:go_router/go_router.dart';

class EditProfileScreen extends ConsumerStatefulWidget {
  const EditProfileScreen({super.key});

  @override
  ConsumerState<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    if (ref.watch(userProvider).isEmpty) {
      context.go('/login');
    }
    return Row(
      children: [
        // const Spacer(),
        const Flexible(flex: 2, child: Navbar()),
        Container(
          width: 900,
          padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: Container(child: EditProfileForm()))
            ],
          ),
          decoration: BoxDecoration(
              border: Border(
                  left: BorderSide(
                      width: 0.5, color: Color.fromARGB(118, 158, 158, 158)),
                  right: BorderSide(
                      width: 0.5, color: Color.fromARGB(118, 158, 158, 158)))),
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
