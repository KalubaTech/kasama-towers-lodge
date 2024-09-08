import 'package:flutter/material.dart';


class ProfileDetailsTile extends StatelessWidget {
  Icon?icon;
  String title;
  String subtitle;
  ProfileDetailsTile({required this.title, required this.subtitle, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          icon??Container(),
          SizedBox(width: icon==null?0:10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('$title', style: TextStyle(fontSize: 10),),
              Text('$subtitle'),
            ],
          ),
        ],
      ),
    );
  }
}
