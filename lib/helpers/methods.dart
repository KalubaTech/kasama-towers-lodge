

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kasama_towers_lodge/controllers/user_controller.dart';
import 'package:get/get.dart';
import 'package:kasama_towers_lodge/models/room_model.dart';
import 'package:kasama_towers_lodge/models/user_model.dart';

class Methods {

  FirebaseFirestore _fs = FirebaseFirestore.instance;

  UserController _userController = Get.find();

  Future<bool>registerUser(String password, String email, String fullname, String phone) async{

    Map<String, dynamic>data = {
      'email':email,
      'password':password,
      'phone':phone,
      'fullname':fullname
    };

    var user = await _fs.collection('users').add(data);
    _userController.user.value.add(UserModel(uid: user.id,fullname: fullname, phone: phone, email: email, password: password));
    _userController.update();
    return true;
  }

  Future<bool>loginUser(String email, String password)async{
    Map<String, dynamic >data = {
      'email':email,
      'password':password
    };

    var user = await _fs.collection('users').where('email',isEqualTo: email).where('password', isEqualTo: password).get();

    if(user.docs.isNotEmpty){
      _userController.user.add(UserModel(uid: user.docs.first.id, fullname: user.docs.first.get('fullname'), phone: user.docs.first.get('phone'), email: email, password: password));
      _userController.update();
      return true;
    }else{
      return false;
    }
  }

  Future<bool>book(RoomModel room, UserModel user, totalPrice, numNights, reservedDates)async{
    var data = {
      'roomId':room.id,
      'totalPrice': totalPrice,
      'numberOfNights': numNights,
      'reservedDates': reservedDates,
      'user': user.uid,
      'dateBooked': '${DateTime.now()}',
      'status':'pending'
    };
    var booking = await _fs.collection('bookings').add(data);

    return true;
  }

}