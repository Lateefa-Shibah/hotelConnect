import 'package:flutter/material.dart';
import 'package:hotel_connect/models/hotel_list.dart';
import 'package:hotel_connect/screens/home/home.dart';
// import 'package:hotel_connect/screens/home/pages/home_screen.dart';
import 'package:hotel_connect/models/user_profile.dart';
import 'package:provider/provider.dart';

class HotelItem extends StatelessWidget {
  final HotelList item;
  final UserProfile userProfileInfo;
  HotelItem({this.item, this.userProfileInfo});

  @override
  Widget build(BuildContext context) {
    final hotelDetail = Provider.of<HotelList>(context) ??
        HotelList(
          location: '',
          overview: '',
          name: '',
          logo: '',
        );
    return Padding(
      padding: EdgeInsets.only(top: 2.0),
      child: Container(
        height: 100.0,
        child: Card(
          elevation: 10.0,
          color: Colors.pinkAccent[100],
          margin: EdgeInsets.fromLTRB(3.0, 2.0, 3.0, 0.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Home()));
            },
            leading: Icon(
              Icons.local_hotel,
              color: Colors.blueAccent,
            ),
            title: Text(item.name),
            subtitle: Text(
              item.overview,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.red),
            ),
            trailing: Icon(
              Icons.play_arrow,
              color: Colors.purpleAccent,
            ),
            isThreeLine: true,
          ),
        ),
      ),
    );
  }
}
