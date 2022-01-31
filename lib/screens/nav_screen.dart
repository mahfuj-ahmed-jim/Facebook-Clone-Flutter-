import 'package:facebook_clone/data/data.dart';
import 'package:facebook_clone/screens/home_screen.dart';
import 'package:facebook_clone/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key? key}) : super(key: key);

  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> screens = [
    const HomeScreen(),
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
  ];
  final List<IconData> icons = [
    Icons.home,
    Icons.ondemand_video,
    MdiIcons.accountCircleOutline,
    MdiIcons.accountGroupOutline,
    MdiIcons.bellOutline,
    Icons.menu,
  ];
  int selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return DefaultTabController(
        length: icons.length,
        child: Scaffold(
          appBar: Responsive.isDekstop(context)
              ? PreferredSize(
                  preferredSize: Size(screenSize.width, 100),
                  child: CustomAppBar(
                    currentUser: currentUser,
                    icons: icons,
                    selectIndex: selectIndex,
                    onTap: (index) => setState(() => selectIndex = index),
                  ),
                )
              : null,
          body: IndexedStack(
            index: selectIndex,
            children: screens,
          ),
          bottomNavigationBar: !Responsive.isDekstop(context)
              ? Container(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: CustomTabBar(
                      icons: icons,
                      selectIndex: selectIndex,
                      onTap: (index) {
                        setState(() {
                          selectIndex = index;
                        });
                      }),
                )
              : const SizedBox.shrink(),
        ));
  }
}
