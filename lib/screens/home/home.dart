import 'package:flutter/material.dart';
import 'package:hotel_connect/models/hotel_list.dart';
import 'package:hotel_connect/models/order_model.dart';
import 'package:hotel_connect/screens/home/drawer.dart';
import 'package:hotel_connect/screens/home/pages/events/events.dart';
import 'package:hotel_connect/screens/home/pages/home_screen.dart';
import 'package:hotel_connect/services/database.dart';
import 'package:provider/provider.dart';
import 'package:hotel_connect/models/hotel.dart';


class Home extends StatefulWidget {

  // final AuthService _auth = AuthService();

  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
  Widget _currentPage = HomeScreen();

  @override
  Widget build(BuildContext context) {

   
    

    

    return StreamProvider<HotelList>.value(
      value: DatabaseService().hoteldetail,
          child: StreamProvider<List<OrderModel>>.value(
        value: DatabaseService().orderLists,
            child: StreamProvider<List<Hotel>>.value(
          value: DatabaseServices().hotels ,
              child: Scaffold(
            backgroundColor: Colors.white,
            appBar:AppBar(
              title: Text(
                'hotelConnect',
                style:TextStyle(color: Colors.white, fontSize: 18.0),
              ),
              backgroundColor: Colors.redAccent,
              elevation: 0.0,
              actions: <Widget>[
                FlatButton.icon(
                  icon: Icon(Icons.home),
                  label: Text(
                    'Home',
                    style:TextStyle(color: Colors.white, fontSize: 12.0),
                    ),
                  onPressed:(){
                    setState(() {
                      _currentPage = HomeScreen();
                      
                    });
                  },
                  ),
                FlatButton.icon(
                  icon:Icon(Icons.event),
                  label: Text(
                    'Events',
                    style:TextStyle(color: Colors.white, fontSize: 12.0),),
                  onPressed:(){
                    setState(() {
                      _currentPage = Events();
                      
                      });
                      },
                  ),
                  ],
            ),
            body: _currentPage,
            drawer: MyDrawer(),
                ),
              ),
      ),
    );
  }
}
