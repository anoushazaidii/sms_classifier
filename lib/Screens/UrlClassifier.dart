// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Services/classifier.dart';

// ignore: camel_case_types, must_be_immutable
class urlClassifier extends StatefulWidget {

  urlClassifier({Key? key}) : super(key: key);

  @override
  State<urlClassifier> createState() => _urlClassifierState();
}

class _urlClassifierState extends State<urlClassifier> {
  final TextEditingController _urlController = TextEditingController();

  String _prediction1 = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text("Spam-Detect"),
      ),
      body: Padding(
        
        padding: const EdgeInsets.all(2.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
               SizedBox(
                height: 10,
              ),
                Text(
                'Analyze URL',
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
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                     Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Enter any URL',
                        style: GoogleFonts.lato(
                          color:  Color(0xff110e53),
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
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          contentPadding: EdgeInsets.all(10.0),
                        ),
                        controller: _urlController,
                        maxLines: null,
                      ),
                    ),
                    SizedBox(height: 20),
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
                        predictURL(_urlController, (prediction) {
                          setState(() {
                            _prediction1 = prediction;
                          });
                        });
                      },)),
                    
                          
                    SizedBox(height: 20),
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
                                 
                    SizedBox(height: 10),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                        "Safe",
                        style: GoogleFonts.lato(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
