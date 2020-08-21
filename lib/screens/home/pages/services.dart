import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hotel_connect/screens/home/pages/home_screen.dart';



// var bannerItems =["Pharmacy", "Transport", "GiftShop", "Laundry"];
// var bannerImage = [
//   "assets/images/pharmacy.jpg",
//   "assets/images/transport.jpg",
//   "assets/images/shopping.jpg", 
//   "assets/images/laundry.jpg"
//   ];


class Services extends StatefulWidget {
  @override
  _ServicesState createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  @override
  Widget build(BuildContext context) {

    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    Future<List<Widget>> createList() async{
      List<Widget> items = new List<Widget>();
      String dataString = await DefaultAssetBundle.of(context).loadString("assets/data.json");
      List<dynamic> dataJSON = jsonDecode(dataString);

        dataJSON.forEach((object) {

          String finalString = "";
          List<dynamic> dataList = object["placeItems"];
          dataList.forEach((item) {
            finalString = finalString + item + "| ";
           });

          items.add(Padding(padding: EdgeInsets.all(2.0),
          child: Container(
            decoration: BoxDecoration(
              color:Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              boxShadow:[
                BoxShadow(
                    color:Colors.black12,
                    blurRadius:5.0,
                    spreadRadius:2.0,
                    )]

            ),
            margin: EdgeInsets.all(5.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), bottomLeft: Radius.circular(10.0)),
                  child: Image.asset(object["placeImage"],width:80, height:100, fit: BoxFit.cover,),  
                ),
                SizedBox(
                  width: 250,
                  child: Padding(padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(object["placeName"]),
                      Padding(padding: const EdgeInsets.only(top:2.0, bottom: 2.0),
                      child: Text(finalString, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 12.0, color: Colors.black54,), maxLines: 1,),
                      ),
                      
                    ],
                  ),
                  ),
                )
              ],
            ),
          ),
          ));
          
        });
        return items;
    }


    return 
    Scaffold(
          body: Container(
            height: screenHeight,
            width: screenWidth,
            child: SafeArea(child:SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:<Widget>[
                        IconButton(icon: Icon(Icons.menu), onPressed: (){
                          Navigator.pop(context, MaterialPageRoute(builder: (context)=> Drawer()));
                        }),
                        Text ("Other Services", style: TextStyle(fontSize: 25),),
                        IconButton(icon: Icon(Icons.exit_to_app), onPressed: (){
                          Navigator.pop(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
                        }),
                      ],
                    ),
                  ),
                  BannerWidgetArea(),
                  Container(
                    child:FutureBuilder(
                      initialData: <Widget>[Text("")],
                      future: createList(),
                      builder:(context, snapshot){
                      if(snapshot.hasData){
                        return Padding(padding: EdgeInsets.all(8.0),
                    child: ListView(
                      primary: false,
                      shrinkWrap: true,
                      children: snapshot.data,
                    ),
                    );
                    }else{
                      return CircularProgressIndicator();
                    }
                    }),
                  ),
                  
                ],
            
          ),
        ),
      ),
  
  ),
    
    );
  }
}

var bannerItems =["Pharmacy", "Transport", "GiftShop", "Laundry"];
var bannerImage = [
  "assets/images/pharmacy.jpg",
  "assets/images/transport.jpg",
  "assets/images/shopping.jpg", 
  "assets/images/laundry.jpg"
  ];

class BannerWidgetArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    PageController controller = PageController(viewportFraction:0.8,initialPage:1);

    List<Widget> banners = new List<Widget>();

    for(int x = 0; x<bannerItems.length; x++){
      var bannerView = Padding(
        padding: EdgeInsets.all(10.0),
        child: Container(
          child: Stack(
            fit: StackFit.expand,
            children:<Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                boxShadow:[
                  BoxShadow(
                    color:Colors.black38,
                    offset:Offset(2.0,2.0),
                    blurRadius:5.0,
                    spreadRadius:1.0,

                  )
                ]
              ),
            ),

            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              child: Image.asset(
                bannerImage[x],
                fit:BoxFit.cover,
                ),
                ),
            
            Container(
              decoration: BoxDecoration(
                borderRadius:BorderRadius.all(Radius.circular(20.0)),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black]
                  ), 
              ),
            ),

            Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                Text(
                  bannerItems[x], 
                  style: TextStyle(fontSize:25.0, color:Colors.white),
                  ),
                Text(
                  'More than 10% Off', 
                  style: TextStyle(fontSize:25.0, color:Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      );
      banners.add(bannerView);

    }

    return Container(
      width: screenWidth,
      height: screenWidth *9/16,
      child: PageView(
        controller: controller ,
        scrollDirection: Axis.horizontal,
        children: banners,

      ),
      
    );
  }
}