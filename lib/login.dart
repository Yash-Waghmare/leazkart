import 'package:flutter/material.dart';
import 'package:leazkart/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:leazkart/homescreen.dart';

class login extends StatefulWidget {

  static String id='Login';

  @override
  _loginState createState() => _loginState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = new RegExp(p);
bool validation(){
  final FormState? _form = _formKey.currentState;
  if(_form!.validate()){
    return false;
  }
  else {
    return true;
  }
}
bool obserText = true;

class _loginState extends State<login> {

  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 300,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextFormField(
                      validator: (value){
                        if(value==""){
                          return "Enter your email";
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
                        border: OutlineInputBorder(),
                        hintText: "Email",
                        hintStyle: TextStyle(
                          color: Colors.black
                        )
                      ),
                    ),
                    TextFormField(
                      obscureText: obserText,
                      validator: (value){
                        if(value=="") {
                          return "Please Fill Password";
                        }
                        else if (value!.length <8){
                          return "Password is too Short";
                        }
                        return "";
                      },
                      onChanged: (value){
                        password = value;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Password",
                        suffixIcon: GestureDetector(
                          onTap: (){
                            FocusScope.of(context).unfocus();
                            setState(() {
                            obserText = !obserText;
                            });
                          },
                          child: Icon(
                            obserText == true? Icons.visibility:Icons.visibility_off,
                            color: Colors.black,
                          ),
                        ),
                        hintStyle: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      height: 45,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          if(validation()== true){
                            try {
                              final newUser = await _auth.signInWithEmailAndPassword(
                                  email: email,
                                  password: password,
                              );
                              Navigator.pushNamed(context, home.id);
                            }catch (e){
                              print(e);
                            }
                          }

                        },
                          style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue)
                          ),
                          child: Text("Login"),
                      ),
                    ),
                    Center(
                      child: Row(
                        children: <Widget>[
                          Text("Don't have an Account!"),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.pushNamed(context, signup.id);

                            },
                            child: Text(
                              "Signup",
                              style: TextStyle(
                                color: Colors.cyan,
                                fontSize: 20,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}