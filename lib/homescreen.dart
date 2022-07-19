import 'package:flutter/material.dart';
import 'package:leazkart/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';


class home extends StatefulWidget {

  static String id = 'Home';

  @override
  State<home> createState() => _homeState();
}

final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

class _homeState extends State<home> {

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: Drawer(
        backgroundColor: Colors.lightBlue,
        child: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('Images/profile.jpg'),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    child: Text(
                      'Sarvesh Chavan',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              title: Text(
                'Order\'s',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              trailing: Icon(
                Icons.shopping_basket,
                color: Colors.white,
              ),
            ),
            ListTile(
              title: Text(
                'Payment Options',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              trailing: Icon(
                Icons.payment,
                color: Colors.white,
              ),
            ),
            ListTile(

              title: Text(
                'Exit',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              trailing: TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.only(left: 60),
                ),

                onPressed: (){
                  setState((){
                    Navigator.pop(context);
                  });
                },
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){setState(() {
            _key.currentState?.openDrawer();
          }
          );},
          icon: Icon(
            Icons.menu,
            color: Colors.lightBlue,
          ),
        ),
        actions: [
          IconButton(
            onPressed: (){setState(() {
              _auth.signOut();
              Navigator.pushNamed(context, welcome.id);
            }
            );},
            icon: Icon(
              Icons.logout,
              color: Colors.lightBlue,
            ),
          )
        ],
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'leazkart',
          style: TextStyle(
            color: Colors.lightBlue,
            fontSize: 20,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
