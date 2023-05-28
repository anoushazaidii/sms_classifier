// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Services/classifier.dart';

// ignore: camel_case_types, must_be_immutable
class smsClassifier extends StatefulWidget {
  smsClassifier({Key? key}) : super(key: key);

  @override
  State<smsClassifier> createState() => _smsClassifierState();
}

class _smsClassifierState extends State<smsClassifier> {
  final TextEditingController _messageController = TextEditingController();

  String _prediction1 = '';

  String _prediction2 = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(2.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Text('Analyze SMS',
                  style: GoogleFonts.merriweather(
                    color: Color(0xff110e53),
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  )),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 90),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Enter SMS text',
                        style: GoogleFonts.lato(
                          color: Color(0xff110e53),
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 12.0),
                    Container(
                      width: 500,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: TextField(
                        maxLines: null,
                        style: TextStyle(fontSize: 16.0),
                        decoration: InputDecoration(
                          border: InputBorder.none, // Remove the default border
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 25.0,
                              horizontal: 10.0), // Add vertical padding
                          hintText: 'Enter text',
                        ),
                        controller: _messageController,
                      ),
                    ),
                    // Container(
                    //   width: 500,
                    //   decoration: BoxDecoration(
                    //     border: Border.all(color: Colors.black),
                    //     borderRadius: BorderRadius.circular(10.0),
                    //   ),
                    //   child: TextField(
                    //     style: GoogleFonts.lato(height: 8),
                    //     decoration: InputDecoration(
                    //       border: OutlineInputBorder(
                    //         borderSide: BorderSide(color: Colors.transparent),
                    //       ),
                    //       contentPadding: EdgeInsets.all(10.0),
                    //     ),
                    //     controller: _messageController,
                    //     maxLines: null,
                    //     cursorWidth: 2.0, // Adjust the cursor width as desired
                    //     textAlign: TextAlign
                    //         .start, // Align the text to the start of the line
                    //   ),
                    // ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        SizedBox(
                          width: 30,
                        ),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: MaterialButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  side: BorderSide(color: Colors.black),
                                ),
                                height: 40.0,
                                minWidth: 130.0,
                                color: Color(0xff110e53),
                                textColor: Colors.white,
                                child: Text("Analyze SMS"),
                                onPressed: () {
                                  print("its here");
                                  predictSMS(_messageController, (prediction) {
                                    setState(() {
                                      _prediction1 = prediction;
                                    });
                                  });
                                })),
                        SizedBox(
                          width: 30,
                        ),
                        Align(
                            alignment: Alignment.centerRight,
                            child: MaterialButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                side: BorderSide(color: Colors.black),
                              ),
                              height: 40.0,
                              minWidth: 130.0,
                              color: Color(0xff110e53),
                              textColor: Colors.white,
                              child: Text("Analyze Sentiment"),
                              onPressed: () {
                                print("its here");
                                predictSentiment(_messageController,
                                    (prediction) {
                                  setState(() {
                                    _prediction2 = prediction;
                                  });
                                });
                              },
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'Result-',
                        style: GoogleFonts.lato(
                          color: Color(0xff110e53),
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "$_prediction1",
                          style: GoogleFonts.lato(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          "$_prediction2",
                          style: GoogleFonts.lato(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
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
