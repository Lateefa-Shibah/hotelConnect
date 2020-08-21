import 'package:flutter/material.dart';
import 'package:hotel_connect/models/hotel_list.dart';
import 'package:hotel_connect/services/load_image_storage.dart';
import 'package:hotel_connect/shared/constants.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final hotelDetail = Provider.of<HotelList>(context) ??
        HotelList(
          location: '',
          overview: '',
          name: '',
          logo: '',
        );
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color.fromRGBO(1, 89, 99, 1.0), Colors.redAccent[100]],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
      ),
      child: ListView(
        children: <Widget>[
          GridView(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
            children: <Widget>[
              GetImageFromFirebase(
                filePath: 'hotel_list/logo1.png',
              ),
              GetImageFromFirebase(
                filePath: 'hotel_list/logo1.png',
              ),
              GetImageFromFirebase(
                filePath: 'hotel_list/logo1.png',
              ),
            ],
          ),
          Card(
            color: Colors.pink[100],
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'Location',
                  style: heading1TextStyle,
                ),
                Text(
                  hotelDetail.location,
                  style: bodyTextStyle,
                ),
              ],
            ),
          ),
          Card(
            color: Colors.pink[100],
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'About',
                  style: heading1TextStyle,
                ),
                Text(
                  hotelDetail.overview,
                  style: bodyTextStyle,
                ),
              ],
            ),
          ),
          Card(
            color: Colors.pink[100],
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'Products and Services',
                  style: heading1TextStyle,
                ),
                Text(
                  hotelDetail.location,
                  style: bodyTextStyle,
                ),
              ],
            ),
          ),
          Card(
            color: Colors.pink[100],
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'Working Hours',
                  style: heading1TextStyle,
                ),
                Text(
                  hotelDetail.location,
                  style: bodyTextStyle,
                ),
              ],
            ),
          ),
          Card(
            color: Colors.pink[100],
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'Other Branches',
                  style: heading1TextStyle,
                ),
                Text(
                  hotelDetail.location,
                  style: bodyTextStyle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  //   return Container(
  //         child: Stack(
  //           fit: StackFit.expand,
  //           children:<Widget>[
  //             Image.asset('assets/images/hotel_plain.jpg', 
  //             fit: BoxFit.cover,
  //             color: Colors.black.withOpacity(0.3),
  //             colorBlendMode: BlendMode.darken,
  //             ),
  // //contents of the home screen
  //             Container(
  //               child: Column(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 crossAxisAlignment: CrossAxisAlignment.stretch,
  //                 children:<Widget>[
  //                   Container(
  //                     padding: const EdgeInsets.all(15),
  //                     width: 200,
  //                     height: 80,
  //                     alignment: Alignment.center,
  //                     decoration: BoxDecoration(
  //                       color:Colors.white.withOpacity(0.0),
  //                       borderRadius: BorderRadius.circular(10),
  //                       boxShadow: [
  //                         BoxShadow(
  //                           color: Colors.grey,
  //                           blurRadius:20,
  //                           )
  //                           ]),
  //                       child: Text('Tifanny\'s Inn',textScaleFactor:2),
  //                     ),
  //                     Container(
  //                       padding: const EdgeInsets.all(15),
  //                       width: 200,
  //                       height: 112,
  //                       alignment: Alignment.center,
  //                       decoration: BoxDecoration(
  //                         color:Colors.white.withOpacity(0.3),
  //                         borderRadius: BorderRadius.circular(10),
  //                         boxShadow: [
  //                           BoxShadow(
  //                             color: Colors.white10,
  //                             blurRadius:20,
  //                             )
  //                             ]),
  //                         child: Text(
  //                           'Welcome to Tifanny\'s Inn \nTake your orders safely and comfortably from your phone. \nLet\'s enjoy the digital age together',
  //                           textAlign:TextAlign.right ,
  //                           style:TextStyle(color: Colors.black, fontSize: 16.0,),
  //                           ),
  //                       ),
  //                       Container(
  //                         padding: const EdgeInsets.all(15),
  //                         width: 200,
  //                         height: 100,
  //                         alignment: Alignment.center,
  //                         decoration: BoxDecoration(
  //                           color:Colors.white,
  //                           borderRadius: BorderRadius.circular(10),
  //                           boxShadow: [
  //                             BoxShadow(
  //                               color: Colors.white10,
  //                               blurRadius:20,
  //                               )
  //                               ]),
  //                           child: Text(
  //                             'About\nTiffany\'s Inn offers a great outdoor enviroment for romantic dinners, parties conferences and so much more. \nThe dining experience here is one that is unforgettable.\nDine at Tiffany\'s today',
  //                             // textScaleFactor:1.5,
  //                             textAlign: TextAlign.justify,
  //                             style:TextStyle(color: Colors.black, fontSize: 14.0),
  //                           ),
  //                       ),
  //                       Container(
  //                         padding: const EdgeInsets.all(15),
  //                         width: 180 ,
  //                         height: 150,
  //                         alignment: Alignment.bottomLeft,
  //                         decoration: BoxDecoration(
  //                           color:Colors.white.withOpacity(0.2),
  //                           borderRadius: BorderRadius.circular(10),
  //                           boxShadow: [
  //                             BoxShadow(
  //                               color: Colors.white10,
  //                               blurRadius:20,
  //                               )
  //                               ]),
  //                           child: Text('Services offered include;\n*Accomodation \n*Restaurant\n*Transport\n*Gift shop\n*Pharmacy\n*Laundry ',
  //                           // textScaleFactor:1.5,
  //                           style:TextStyle(color: Colors.black, fontSize: 20.0),
  //                           ),
  //                         ),

  //                         ],
                          
  //                         ),
                    
  //                       //   child: HotelList(),
  //                       // ),
  //             ),
  //           ],
          
  //         ),
  //       );
  }
}