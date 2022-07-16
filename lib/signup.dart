import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:leazkart/login.dart';

class signup extends StatefulWidget {
  @override
  _signupState createState() => _signupState();
}

final GlobalKey<FormState> _formKey=GlobalKey<FormState>();
String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = new RegExp(p);
bool obserText = true;

class _signupState extends State<signup> {
  void validation(){
    final FormState? _form = _formKey.currentState;
    if(_form!.validate()){
      print("No");
    }
    else {
      print("Yes");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 253, 222, 1),
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
                        TextFormField(
                          validator: (value){
                            if(value==""){
                              return "Please fill the Phone Number";
                            }
                            else if (value!.length < 10){
                              return "Phone Number must be 10 digit";
                            }
                            return "";
                          },
                          decoration: InputDecoration(
                            hintText: "Phone Number",
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
                           onPressed: (){
                             validation();
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
