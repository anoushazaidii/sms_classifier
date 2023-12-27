// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:sms_classifier/Services/classifier.dart';

class ipClassifier extends StatefulWidget {
  ipClassifier({Key? key}) : super(key: key);

  @override
  State<ipClassifier> createState() => _ipClassifierState();
}

class _ipClassifierState extends State<ipClassifier> {
  final TextEditingController _ipController = TextEditingController();
  bool showResult = false;
  IPDetails _prediction1 =
      IPDetails(result: '', ipType: '',);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back when the button is pressed
          },
        ),
        // title: const Text("Spam-Detect"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                'Analyze IP',
                style:GoogleFonts.merriweather
                (
                  color: Color(0xff110e53),
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ) 
              
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 90),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Enter IP address',
                        style:  GoogleFonts.lato( 
                          color:  Color(0xff110e53),
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),

                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      width: 500,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          contentPadding: EdgeInsets.all(10.0),
                        ),
                        controller: _ipController,
                        maxLines: null,
                      ),
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(color: Colors.black),
                        ),
                        height: 40.0,
                        minWidth: 120.0,
                        color: Color(0xff110e53),
                        textColor:  Colors.white,
                        child: Text("Analyze"),
                        onPressed: () {
                          print("its here");
                          predictIP(_ipController, (prediction) {
                            setState(() {
                              showResult = true;
                              final jsonResponse = json.decode(prediction);
                              _prediction1 = IPDetails(
                                result: jsonResponse['result'].toString(),
                                ipType: jsonResponse['ip_type'].toString(),
                                // geolocation: Geolocation(
                                //   city: jsonResponse['geolocation']['city']
                                //       .toString(),
                                //   country: jsonResponse['geolocation']['country']
                                //       .toString(),
                                //   latitude: jsonResponse['geolocation']
                                //           ['latitude']
                                //       .toString(),
                                //   longitude: jsonResponse['geolocation']
                                //           ['longitude']
                                //       .toString(),
                                //   region: jsonResponse['geolocation']['region']
                                //       .toString(),
                                // ),
                              );
                            });
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                       Align
                       (
                        alignment: Alignment.bottomLeft,
                         child: Text(
                          'Result-',
                          style: GoogleFonts.lato(
                            color:  Color(0xff110e53),
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                                             ),
                       ),
                    if (showResult == true)
                      Align
                      (
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          '${_prediction1.result}',
                          style: GoogleFonts.lato(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        '${_prediction1.ipType}',
                        style: GoogleFonts.lato(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    if (showResult == true)
                     Align
                       (
                        alignment: Alignment.bottomLeft,
                         child: Text(
                          '',
                          style: GoogleFonts.lato(
                            color:  Color(0xff110e53),
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                                             ),
                       ),
                    // Text(
                    //   '${_prediction1.geolocation.city}',
                    //   style: GoogleFonts.lato(
                    //     fontSize: 18.0,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                    // Text(
                    //   '${_prediction1.geolocation.country}',
                    //   style: GoogleFonts.lato(
                    //     fontSize: 18.0,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                    // Text(
                    //   '${_prediction1.geolocation.latitude}',
                    //   style: GoogleFonts.lato(
                    //     fontSize: 18.0,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                    // Text(
                    //   '${_prediction1.geolocation.longitude}',
                    //   style: GoogleFonts.lato(
                    //     fontSize: 18.0,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                    // Text(
                    //   '${_prediction1.geolocation.region}',
                    //   style: GoogleFonts.lato(
                    //     fontSize: 18.0,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class IPDetails {
  final String result;
  final String ipType;
  // final Geolocation geolocation;

  IPDetails({
    required this.result,
    required this.ipType,
    // required this.geolocation,
  });
}

// class Geolocation {
//   final String? city;
//   final String? country;
//   final String? latitude;
//   final String? longitude;
//   final String? region;

//   Geolocation({
//     this.city = '',
//     this.country = '',
//     this.latitude = '',
//     this.longitude = '',
//     this.region = '',
//   });
// }
