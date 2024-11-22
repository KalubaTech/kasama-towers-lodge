import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kasama_towers_lodge/utils/colors.dart';

import '../models/room_model.dart';
import '../views/rooms/view_room.dart';


class HomeCategoryContainer extends StatelessWidget {
  RoomModel room;
  HomeCategoryContainer(this.room);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>Get.to(()=>ViewRoom(room)),
      child: Container(
        width: 80,
        decoration: BoxDecoration(
          color: Colors.pinkAccent.withOpacity(0.5),
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
               fit: BoxFit.cover,
              image: AssetImage('assets/room.jpg')
          )
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal:5,vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  room.isBooked?Icon(Icons.book, color: Colors.deepOrange, size: 30,):Container(),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                    decoration: BoxDecoration(
                      color: Karas.primary,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Text('K${room.price}', style: TextStyle(fontSize: 12, color: Colors.white),),
                  )
                ],
              ),
              Spacer(),
              Text('${room.name}', style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis,),
            ],
          ),
        ),
      ),
    );
  }
}
