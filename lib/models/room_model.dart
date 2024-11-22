class RoomModel {
  String id;
  String name;
  String price;
  bool isBooked;
  List amenities;

  RoomModel({required this.name, required this.price, required this.id, required this.amenities, required this.isBooked});
}