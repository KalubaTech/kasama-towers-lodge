import 'package:flutter/material.dart';
import 'package:kasama_towers_lodge/utils/colors.dart';

class DrawerTile extends StatelessWidget {
  String title;
  IconData?icon;
  Function() onclick;

  DrawerTile({required this.title, required this.onclick, this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onclick,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        decoration: BoxDecoration(
          border: BorderDirectional(bottom: BorderSide(color: Karas.primary.withOpacity(0.1)))
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon),
            SizedBox(width: 15,),
            Text(title)
          ],
        ),
      ),
    );
  }
}
