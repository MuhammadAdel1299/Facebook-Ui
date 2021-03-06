import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  //final Widget tablet;
  final Widget desktop;

  const Responsive({
    Key? key,
    required this.mobile,
    //required this.tablet,
    required this.desktop,
  }) : super(key: key);

  static bool isMobile (BuildContext context) =>
      MediaQuery.of(context).size.width < 800;

  static bool isDesktop (BuildContext context) =>
      MediaQuery.of(context).size.width >= 800;


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        if(constrains.maxWidth >= 800){
          return desktop;
        }else {
          return mobile;
        }
      },
    );
  }
}
