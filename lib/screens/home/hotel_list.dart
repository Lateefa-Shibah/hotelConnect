import 'package:flutter/material.dart';
import 'package:hotel_connect/screens/home/hotel_tile.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:hotel_connect/models/hotel.dart';

class HotelList extends StatefulWidget {
  @override
  _HotelListState createState() => _HotelListState();
}

class _HotelListState extends State<HotelList> {
  @override
  Widget build(BuildContext context) {

    final hotels = Provider.of<List<Hotel>>(context) ??[];
   
       return ListView.builder(
         itemCount: hotels.length,
         itemBuilder: (context, index){
           return HotelTile(hotel: hotels[index]);

         },
       );
  }
}