import 'package:flutter/material.dart';

import 'package:sms_classifier/main.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isButtonPressed = false;

  @override
  void initState() {
    super.initState();
    // Add any additional initialization logic here, if needed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,
          ),
          Center(
            child: Image.asset(
              'assets/images/logo.jpeg',
              height: 250,
              width: 250,
              fit: BoxFit.fitWidth,
            ),
          ),
          Text(
            "Keeping your inbox clean safe,\n               and spam free",
            style: TextStyle(fontSize: 20, color: Color(0xff110e53)),
          ),
          SizedBox(
            height: 150,
          ),
          MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(color: Colors.black),
            ),
            height: 60.0,
            minWidth: 300.0,
            color: Colors.white,
            textColor: Color(0xff110e53),
            child: Text("GET STARTED"),
            onPressed: () {
              setState(() {
                isButtonPressed = true;
              });

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MainScreen(),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
