import 'package:flutter/material.dart';
import 'package:hotel_connect/models/hotel.dart';

class HotelTile extends StatelessWidget {

final Hotel hotel;
HotelTile({this.hotel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            // backgroundColor: Colors.red[hotel.strength],
            backgroundImage: AssetImage('assets/eiliv-sonas-aceron-An6cTgmC8yk-unsplash.jpg'),
          ),
          title: Text(hotel.name),
          subtitle: Text('Takes ${hotel.sugars} sugars(s)'),
        ),
      ),
    );
  }
}