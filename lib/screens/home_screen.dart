import 'package:facebook_clone/config/palette.dart';
import 'package:facebook_clone/data/data.dart';
import 'package:facebook_clone/models/models.dart';
import 'package:facebook_clone/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          appBar: !Responsive.isDekstop(context)
              ? AppBar(
                  brightness: Brightness.light,
                  backgroundColor: Colors.white,
                  elevation: 0,
                  title: const Text(
                    'facebook',
                    style: TextStyle(
                      fontSize: 28,
                      color: Palette.facebookBlue,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -1.2,
                    ),
                  ),
                  centerTitle: false,
                  actions: [
                      CircleButton(
                          icon: Icons.search,
                          iconSize: 30,
                          onPressed: () {
                            // ignore: avoid_print
                            print('Search');
                          }),
                      CircleButton(
                          icon: MdiIcons.facebookMessenger,
                          iconSize: 30,
                          onPressed: () {
                            // ignore: avoid_print
                            print('Messanger');
                          }),
                    ])
              : null,
          body: Responsive.isDekstop(context)
              ? const HomeScreenDesktop()
              : const HomeScreenMobile()),
    );
  }
}

class HomeScreenMobile extends StatelessWidget {
  const HomeScreenMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: CreatePostContainer(currentUser: currentUser),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
          sliver: SliverToBoxAdapter(
            child: Room(onlineUsers: onlineUsers),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
          sliver: SliverToBoxAdapter(
            child: Stories(
              currentUser: currentUser,
              stories: stories,
            ),
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
          (context, index) {
            final Post post = posts[index];
            return PostContainer(post: post);
          },
          childCount: posts.length,
        )),
      ],
    );
  }
}

class HomeScreenDesktop extends StatelessWidget {
  const HomeScreenDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 2,
          child: Container(
            color: Colors.blueAccent,
          ),
        ),
        const Spacer(),
        Container(
          width: 600,
          color: Colors.red,
        ),
        const Spacer(),
        Flexible(
          flex: 2,
          child: Container(
            color: Colors.blueAccent,
          ),
        ),
      ],
    );
  }
}
