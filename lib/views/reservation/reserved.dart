import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kasama_towers_lodge/components/kalubtn.dart';
import 'package:kasama_towers_lodge/controllers/rooms_controllelr.dart';
import 'package:kasama_towers_lodge/controllers/user_controller.dart';
import 'package:get/get.dart';
import 'package:kasama_towers_lodge/models/book_model.dart';
import 'package:kasama_towers_lodge/models/room_model.dart';

import '../../utils/colors.dart';

class Reserved extends StatelessWidget {
  Reserved({super.key});

  final UserController _userController = Get.find();
  final RoomsController _roomsController = Get.find();
  final FirebaseFirestore _fs = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reserved Rooms'),
          backgroundColor: Karas.primary,
        foregroundColor: Colors.white,
      ),
      body: StreamBuilder(
        stream: _fs
            .collection('bookings')
            .where('user', isEqualTo: _userController.user.first.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
            var documents = snapshot.data!.docs;

            return ListView.builder(
              itemCount: documents.length,
              itemBuilder: (context, index) {
                var bookingDoc = documents[index];

                // Find the room from the controller
                var filteredRooms = _roomsController.rooms
                    .where((room) => room.id == bookingDoc.get('roomId'));

                if (filteredRooms.isEmpty) {
                  // Room not found
                  return ListTile(
                    title: Text('Unknown Room'),
                    subtitle: Text('Room details not available'),
                  );
                }

                RoomModel room = filteredRooms.first;

                BookModel booking = BookModel(
                  room: room,
                  user: _userController.user.first,
                  nights: bookingDoc.get('reservedDates'),
                  totalPrice: bookingDoc.get('totalPrice').toString(),
                  dateBooked: bookingDoc.get('dateBooked'),
                  status: bookingDoc.get('status'),
                );

                return ListTile(
                  onTap: (){
                    Get.bottomSheet(
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                          width: double.infinity,
                          height: 200,
                          decoration: BoxDecoration(
                            color: Colors.white,
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10,),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                                child: Text('${booking.room.name.toUpperCase()}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Karas.primary),),
                              ),
                              Divider(),
                              Expanded(
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(padding: EdgeInsets.symmetric(horizontal: 20),child: Text('Dates (${booking.nights.length} Nights)', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),)),
                                        Container(
                                          height: 60,
                                          width: double.infinity,
                                          child: ListView(
                                            padding: EdgeInsets.symmetric(horizontal: 20),
                                              scrollDirection: Axis.horizontal,
                                              shrinkWrap: true,
                                              children: [
                                                ...booking.nights.map((day)=>Row(
                                                  children: [
                                                    Chip(
                                                      label: Text('${day}'),
                                                      onDeleted: (){
                                                        //addedDays.remove(day);
                                                      },
                                                      padding: EdgeInsets.symmetric(horizontal: 0),
                                                      deleteIcon: Icon(Icons.cancel),
                                                      deleteIconColor: Colors.red,
                                                    ),
                                                    SizedBox(width: 5,)
                                                  ],
                                                ),)
                                              ],
                                            ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(horizontal: 20),
                                          child: Row(
                                            children: [
                                              Text('PRICE: '),
                                              Text('ZMK ${booking.totalPrice}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                              )
                            ],
                          ),
                        ),
                    );
                  },
                  leading: Container(
                    child: Image.asset('assets/lodge1.jpg',),
                  ),
                  title: Text('${booking.room.name}', style: TextStyle(fontWeight: FontWeight.bold),),
                  subtitle: Text(
                      'Booked for ${booking.nights.length} nights at K${booking.totalPrice}', style: TextStyle(fontSize: 12),),
                  trailing: Column(
                    children: [
                      Text('${booking.status.capitalize}', style: TextStyle(color: Karas.action),),
                      booking.status=='pending'?Kalubtn(
                         width: 60,
                          height: 28,
                          label: 'Cancel',
                          labelStyle: TextStyle(fontSize: 10, color: Colors.white),
                          onclick: (){

                          }
                      ):Container()
                    ],
                  ),
                );
              },
            );
          } else {
            return Center(
              child: Text(
                'No bookings found',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            );
          }
        },
      ),
    );
  }
}
