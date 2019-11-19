import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_google_auth/auth/auth_service.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  final FirebaseUser user;

  MainPage({this.user});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final AuthService _auth = AuthService();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main'),
      ),
      body: Center(
          child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal:16, vertical: 32),
                
                child: Column(
                  children: <Widget>[
                    CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(widget.user.photoUrl)),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${widget.user.displayName}',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(widget.user.email)
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 42,
            ),
            MaterialButton(
              onPressed: () async {
                await _auth.signOut();
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/', (route) => false);
              },
              
              height: 50,
              child: Text(
                'LOGOUT',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
            ),
          ],
        ),
      )),
    );
  }
}
