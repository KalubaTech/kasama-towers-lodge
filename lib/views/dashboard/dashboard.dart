import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kasama_towers_lodge/components/home_category_container.dart';
import 'package:kasama_towers_lodge/components/section_container.dart';
import 'package:kasama_towers_lodge/models/room_model.dart';
import 'package:kasama_towers_lodge/utils/colors.dart';

import '../../components/search_mock.dart';

class Dashboard extends StatelessWidget {
  Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableHome(
        appBarColor: Karas.primary,
        alwaysShowLeadingAndAction: true,
        alwaysShowTitle: true,
        actions: [
        ],

        title: Container(
          child: Row(
            children: [
              Text('Kasama Towers Lodge', style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,  color: Colors.white),)
            ],
          ),
        ),
        headerExpandedHeight: 0.23,
        headerWidget: Container(
          color: Karas.primary,
          padding: EdgeInsets.symmetric(vertical: 40, horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: 50,),
              SearchMock()
            ],
          ),
        ),
        body: [
          SectionContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('ROOMS', style: GoogleFonts.agbalumo(fontSize: 16),),
                        Text('View all', style: TextStyle(color: Karas.action, fontSize: 12),)
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: StreamBuilder(
                      stream: FirebaseFirestore.instance.collection('rooms').snapshots(),
                      builder: (context,s) {
                        return s.hasData && s.data!.docs.isNotEmpty ? GridView(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10
                          ),
                          children: [
                            ...s.data!.docs.map((room)=>HomeCategoryContainer(RoomModel(name: room.get('name'), price: room.get('price'), id: room.id, amenities: room.get('amenities'))))
                          ],
                        ) : Container();
                      }
                    ),
                  ),
                  SizedBox(height: 20,),
                ],
              )
          )
        ]
    );
  }
}
