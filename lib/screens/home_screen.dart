import 'package:facebook_clone/config/palette.dart';
import 'package:facebook_clone/data/data.dart';
import 'package:facebook_clone/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            brightness: Brightness.light,
            backgroundColor: Colors.white,
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
            floating: true,
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
            ],
          ),
          SliverToBoxAdapter(
            child: CreatePostContainer(currentUser: currentUser),
          )
        ],
      ),
    );
  }
}
