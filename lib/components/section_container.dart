import 'package:flutter/material.dart';

class SectionContainer extends StatelessWidget {
  EdgeInsetsGeometry? padding;
  Widget child;
  SectionContainer({this.padding, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10)
      ),
      padding: padding??EdgeInsets.all(0),
      child: child,
    );
  }
}
