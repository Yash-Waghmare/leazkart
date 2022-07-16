import 'package:flutter/material.dart';
import 'package:leazkart/signup.dart';

class login extends StatefulWidget {

  @override
  _loginState createState() => _loginState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = new RegExp(p);
void validation(){
  final FormState? _form = _formKey.currentState;
  if(_form!.validate()){
    print("Yes");
  }
  else {
    print("No");
  }
}
bool obserText = true;

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 253, 222, 1),
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
                          onPressed: (){
                            validation();
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
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(builder: (ctx) => signup()),
                              );
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