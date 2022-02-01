import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget dekstop;

  const Responsive(
      {Key? key, required this.mobile, this.tablet, required this.dekstop})
      : super(key: key);

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600 &&
      MediaQuery.of(context).size.width < 1080;

  static bool isDekstop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1080;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxHeight >= 1080) {
          return dekstop;
        } else if (constraints.maxHeight >= 600 &&
            constraints.maxHeight < 1080) {
          return tablet ?? mobile;
        } else {
          return mobile;
        }
      },
    );
  }
}
