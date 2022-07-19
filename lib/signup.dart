import 'package:flutter/material.dart';
import 'package:leazkart/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:leazkart/homescreen.dart';

class signup extends StatefulWidget {

  static String id = 'signup';
  @override
  _signupState createState() => _signupState();
}

final GlobalKey<FormState> _formKey=GlobalKey<FormState>();
String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = new RegExp(p);
bool obserText = true;

class _signupState extends State<signup> {

  final _auth = FirebaseAuth.instance;
   late String email;
   late String userName;
   late String password;


  bool validation(){
    final FormState? _form = _formKey.currentState;
    if(_form!.validate()){
      return false;
    }
    else {
      return true;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Form(
            key: _formKey,
            child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 160,

                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text("Registration",
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,

                  ),
                  Container(

                    height: 400,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    width: double.infinity,

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        TextFormField(
                          validator: (value){
                            if(value!.length < 6){
                              return "UserName is Too Short";
                             }
                            else if(value==""){
                              return "Please Fill UserName";
                            }
                            return "";
                           },
                          onChanged: (value){
                            userName = value;
                          },


                          decoration: InputDecoration(
                            hintText: "Username",
                            hintStyle: TextStyle(
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        TextFormField(
                          validator: (value){
                            if(value== ""){
                              return "Please Fill Email";
                            }
                            else if (!regExp.hasMatch(value!)){
                              return "Email is Invalid";
                            }
                            return "";
                          },
                          onChanged: (value){
                            email = value;
                          },
                          decoration: InputDecoration(
                            hintText: "Email",
                            hintStyle: TextStyle(
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        TextFormField(
                          obscureText: obserText,
                          validator: (value){
                            if(value==""){
                              return "Please Enter the Password";
                            }
                            else if (value!.length < 8){
                              return "Password is Too Short";
                            }
                            return "";
                          },
                          onChanged: (value){
                            password = value;
                          },
                          decoration: InputDecoration(
                            hintText: "Password",
                            suffixIcon: GestureDetector(
                              onTap: (){
                                setState(() {
                                  obserText = !obserText;
                                });
                                FocusScope.of(context).unfocus();
                              },
                              child: Icon(Icons.visibility,color: Colors.black,),
                            ),
                            hintStyle: TextStyle(
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(),
                          ),
                        ),

                         Container(
                           height: 45,
                           width: double.infinity,
                           child: ElevatedButton(
                           onPressed: () async {
                             if(validation()== true){
                               try {
                                 final newUser = await _auth
                                     .createUserWithEmailAndPassword(
                                     email: email, password: password);
                                 User? user = newUser.user;
                                 user?.updateDisplayName(userName);
                                 Navigator.pushNamed(context, home.id);
                               }catch (e){
                                 print(e);
                               }
                             }

                           },
                           child: Text("Register"),
                           style: ButtonStyle(
                           backgroundColor: MaterialStateProperty.all<Color>(Colors.blueGrey)
                            ),
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Text("Already have an Account!!"),
                            SizedBox(
                              width: 20,
                            ),
                            GestureDetector(
                              onTap: (){
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(builder: (ctx) => login()),
                                );
                              },
                              child: Text("Login",
                              style: TextStyle(
                                color: Colors.cyan,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),

                  )
                ],
              ),
            ),
          ),
        )
    );

  }
}
