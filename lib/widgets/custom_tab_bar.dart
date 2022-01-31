import 'dart:math';

import 'package:facebook_clone/config/palette.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final List<IconData> icons;
  final int selectIndex;
  final Function(int) onTap;

  const CustomTabBar(
      {Key? key,
      required this.icons,
      required this.selectIndex,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorPadding: EdgeInsets.zero,
      indicator: const BoxDecoration(
          border: Border(
        top: BorderSide(color: Palette.facebookBlue, width: 3),
      )),
      tabs: icons
          .asMap()
          .map((i, e) => MapEntry(
                i,
                Tab(
                    icon: Icon(
                  e,
                  color:
                      i == selectIndex ? Palette.facebookBlue : Colors.black45,
                  size: 30,
                )),
              ))
          .values
          .toList(),
      onTap: (index) {
        onTap(index);
      },
    );
  }
}
