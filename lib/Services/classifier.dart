import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> predictSMS(
  TextEditingController _ipController,Function(String) updatePrediction,) async {
  print("$updatePrediction");
  String ipAddress = _ipController.text;
  print("$ipAddress");
  String apiUrl ='http://10.0.2.2:8080/classifysms'; 
  print("$apiUrl")  ;// Replace with your Flask API URL
  try {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'sms': ipAddress}),
    );
    

    if (response.statusCode == 200) {
      print("{response}");
      updatePrediction(response
          .body); 
    } else {
      updatePrediction(
          'Error: ${response.statusCode}');
    }
  } on SocketException catch (e) {
    print("Error: $e");
    updatePrediction(
        'Error: $e'); 
  }
   print(updatePrediction);
}


Future<void> predictSentiment(
  TextEditingController _ipController,Function(String) updatePrediction,) async {
  print("$updatePrediction");
  String ipAddress = _ipController.text;
  print("$ipAddress");
  String apiUrl ='http://10.0.2.2:8080/analyze_sentiment'; 
  print("$apiUrl")  ;// Replace with your Flask API URL
  try {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'sms': ipAddress}),
    );

    if (response.statusCode == 200) {
      print("{response}");
      updatePrediction(response
          .body); 
    } else {
      updatePrediction(
          'Error: ${response.statusCode}');
    }
  } on SocketException catch (e) {
    print("Error: $e");
    updatePrediction(
        'Error: $e'); 
  }
   print(updatePrediction);
}


Future<void> predictIP(
  TextEditingController _ipController, Function(String) updatePrediction) async {
  String ipAddress = _ipController.text;
  String apiUrl = 'http://10.0.2.2:8080/analyze_ip'; // Replace with your Flask API URL
  
  try {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'ip': ipAddress}),
    );
  
    if (response.statusCode == 200) {
      updatePrediction(response.body);
    } else {
      updatePrediction('Error: ${response.statusCode}');
    }
  } on SocketException catch (e) {
    updatePrediction('Error: $e');
  }
  
  // _ipController.clear();
}




Future<void> predictURL(
  TextEditingController _urlController, Function(String) updatePrediction) async {
  String url = _urlController.text;
  String apiUrl = 'http://10.0.2.2:5000/classify_url'; // Replace with your Flask API URL
  
  try {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'url': url}),
    );
  
    if (response.statusCode == 200) {
      updatePrediction(response.body);
    } else {
      updatePrediction('Error: ${response.statusCode}');
    }
  } on SocketException catch (e) {
    updatePrediction('Error: $e');
  }
  
  // _ipController.clear();
}


