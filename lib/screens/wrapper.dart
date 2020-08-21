import 'package:flutter/material.dart';
import 'package:hotel_connect/models/hotel_list.dart';
import 'package:hotel_connect/models/user.dart';
import 'package:hotel_connect/screens/authenticate/authenticate.dart';
// import 'package:hotel_connect/screens/home/home.dart';
import 'package:hotel_connect/screens/home_base/home_page.dart';
import 'package:hotel_connect/services/database.dart';
import 'package:provider/provider.dart';
// import 'package:hotel_connect/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final user = Provider.of<User>(context);
    return user == null
        ? Authenticate()
        : StreamProvider<List<HotelList>>.value(
            value: DatabaseService().hotelLists, child: HomePage());
    
    
  }
}
