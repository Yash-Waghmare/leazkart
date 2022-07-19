import 'package:flutter/material.dart';
import 'package:leazkart/signup.dart';
import 'package:leazkart/login.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class welcome extends StatefulWidget {
  static String id='Welcome';

  @override
  State<welcome> createState() => _welcomeState();
}

class _welcomeState extends State<welcome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              height: 300,
              child: Center(
                child: DefaultTextStyle(
                  style: TextStyle(
                    color: Colors.lightBlue,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                  child: AnimatedTextKit(
                    repeatForever: true,
                    animatedTexts: [
                      FlickerAnimatedText('leazkart'),]

                ),
                )

              ),
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(left: 10),
                    height: 30,
                    child: Center(
                      child: Text(
                        'New Customer?',
                        style: TextStyle(
                          color: Colors.lightBlue,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 200,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.lightBlue,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),

                      onPressed: () {
                        setState((){
                          Navigator.pushNamed(context, signup.id);
                        });
                      },
                      child: Text(
                        'SignUp',
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(left: 10),
                    height: 30,
                    child: Center(
                      child: Text(
                        'Existing Customer?',
                        style: TextStyle(
                          color: Colors.lightBlue,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 200,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.lightBlue,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),

                      onPressed: () {
                        setState((){
                          Navigator.pushNamed(context, login.id);
                        });
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}