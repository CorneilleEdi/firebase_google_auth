import 'package:firebase_google_auth/auth/auth_service.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthService _auth = AuthService();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    //Check auth on login page
    _auth.getUser.then(
      (user) {
        if (user != null) {
          Navigator.pushReplacementNamed(context, '/main', arguments: user);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Login",
                  style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16,),
                Text(
                  'Google login with firebase',
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
            SizedBox(
              height: 150,
            ),
            MaterialButton(
              onPressed: () async {
                var user = await _auth.googleSignIn();

                if (user != null) {
                  Navigator.pushReplacementNamed(context, '/main',
                      arguments: user);
                } else {
                  _scaffoldKey.currentState.showSnackBar(SnackBar(
                      content: new Text('Login error, please try again')));
                }
              },
              minWidth: double.infinity,
              height: 50,
              child: Text(
                'SIGN IN WITH GOOGLE',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
