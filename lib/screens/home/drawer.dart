import 'package:flutter/material.dart';
import 'package:hotel_connect/screens/home/pages/services.dart';
import 'package:hotel_connect/screens/ordering/ordering.dart';
import 'package:hotel_connect/screens/payments/payment.dart';
// import 'package:hotel_connect/screens/home/settings_form.dart';
import 'package:hotel_connect/services/auth.dart';


class MyDrawer extends StatelessWidget {

  
  final AuthService _auth = AuthService();


  @override
  Widget build(BuildContext context) {
    // void _showSettingsPanel(){
    //   showModalBottomSheet(context:context, builder:(context){

    //     return Container(
    //       padding: EdgeInsets.symmetric(vertical:20.0, horizontal: 60.0),
    //       // child: SettingsForm(),
    //     );
      // });
    //  }

     
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0),
        children:<Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Lateefa Shibah"), 
            accountEmail: Text("abc@gmail.com"),
            currentAccountPicture:CircleAvatar(
            backgroundImage: AssetImage("assets/images/hotel_pool.jpg") ,  
            )
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text ("Lateefa Shibah"),
            subtitle: Text("Intern"),
            trailing: Icon(Icons.edit),
            onTap: (){},
                ),
          ListTile(
            leading: Icon(Icons.email),
            title: Text ("Email"),
            subtitle: Text("abc@gmail.com"),
            trailing: Icon(Icons.edit),
                ),
          ListTile(
            leading: Icon(Icons.contacts),
            title: Text ("Contact"),
            subtitle: Text("+256 708 998 765"),
            trailing: Icon(Icons.edit),
                ),
          ListTile(
            leading: Icon(Icons.restaurant_menu),
            title: Text ("Restaurant"),
            subtitle: Text("Order your food here"),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> OrderingPage()));              
            }),
          ListTile(
            leading: Icon(Icons.attach_money),
            title: Text ("Payments"),
            subtitle: Text("Choose a payment plan"),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> PaymentPage()));
            }),
          ListTile(
            leading: Icon(Icons.category),
            title: Text ("Services"),
            subtitle: Text("Discover other services offered"),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Services()));
            }),
          ListTile(
            leading: Icon(Icons.settings_applications),
            title: Text ("Settings"),
            subtitle: Text("Update your profile"),
            onTap: () {}
            // => _showSettingsPanel(),
            ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text ("Log Out"),
            subtitle: Text(""),
            onTap: ()async{
              await _auth.signOut();
              }, 
              ),
             ]
           ),
          );    
  }
 }
