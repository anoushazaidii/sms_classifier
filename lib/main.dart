import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sms_classifier/Screens/IpAddressClassifier.dart';
import 'package:sms_classifier/Screens/SmsClassifier.dart';
import 'package:sms_classifier/Screens/UrlClassifier.dart';
import 'package:sms_classifier/splashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Spam-Detect',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff110e53)),
        useMaterial3: true,
      ),
      routes: {
        '/analyze_ip': (context) => ipClassifier(),
        '/analyze_sms': (context) => smsClassifier(),
        '/analyze_url': (context) => urlClassifier(),
        // Add routes for other analysis pages here
      },
      home: SplashScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            // Image.asset(
            //   'assets/images/icon.png',
            //   height: 30, // Adjust the height as needed
            // ),
            SizedBox(
                width: 8), // Add some spacing between the logo and app name
            // Text(

            //   style: TextStyle(
            //     fontSize: 18,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 100.0),
            Text('HOME',
                style: GoogleFonts.merriweather(
                  color: Color(0xff110e53),
                  fontSize: 44.0,
                  fontWeight: FontWeight.bold,
                )),
            SizedBox(height: 70.0),
            CustomButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/analyze_ip');
                },
                buttonText: "ANALYZE IP"),
            SizedBox(height: 16.0),
            CustomButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/analyze_sms');
                },
                buttonText: "ANALYZE SMS"),
            SizedBox(height: 16.0),
            CustomButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/analyze_url');
                },
                buttonText: "ANALYZE URL"),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;

  const CustomButton({
    required this.onPressed,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(color: Colors.black),
      ),
      height: 60.0,
      minWidth: 300.0,
      color: Colors.white,
      textColor: Color(0xff110e53),
      child: Text(buttonText),
      onPressed: onPressed,
    );
  }
}
