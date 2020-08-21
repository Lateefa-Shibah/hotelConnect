import 'package:flutter/material.dart';
import 'package:hotel_connect/services/auth.dart';
import 'package:hotel_connect/shared/constants.dart';
import 'package:hotel_connect/shared/loading.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  //text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading? Loading(): Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        elevation: 0.0,
        title: Text('Login to hotelConnect'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text(
              'SignUp',
              style:TextStyle(color: Colors.white, fontSize: 16.0),
              ),
            onPressed: (){
              widget.toggleView(); 
            }
            )
        ],
      ), 
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal:50),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height:20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Email'),
                validator: (val) => val.isEmpty? 'Enter an Email' : null,
                onChanged:(val){
                  setState(() => email = val);

                }
              ),
              SizedBox(height:20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Password'),
                obscureText: true,
                validator: (val) => val.length <6 ? 'Enter a password with 6+ characters long' : null,
                onChanged:(val){
                  setState(() => password = val);

                }
              ),
              SizedBox(height:20.0),
              RaisedButton(
                color: Colors.redAccent,
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white),
                  ),
                  onPressed: ()async{
                   if(_formKey.currentState.validate()){
                     setState(() => loading = true);
                     dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                     if(result == null){
                      setState(() {
                        error = 'Failed to Login';
                        loading = false;
                        });
                     }
                    }
                }
                ),
                SizedBox(height: 12.0),
                Text(
                  error,
                  style:TextStyle(color: Colors.red, fontSize: 14.0),
                ),
               ],
          )
        ),
      ),
    );
  }
}