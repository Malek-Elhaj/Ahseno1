import 'package:cloud_firestore/cloud_firestore.dart';

class CartCase {
  late String id;
  late String image;
  late String title;
  late int total;
  late String section;
  late int amount;
  late String description;
  late double req;
  late String mostafid;
  late String location;
  late Timestamp date;
  late String uId;


  CartCase(
      this.id,
      this.image,
      this.title,
      this.total,
      this.section,
      this.amount,
      this.description,
      this.req,
      this.mostafid,
      this.location,
      this.date,
      this.uId);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'title': title,
      'total': total,
      'section': section,
      'amount':amount,
      'description':description,
      'req':req,
      'mostafid':mostafid,
      'location':location,
      'date':date,
      'uId':uId
    };
  }
}