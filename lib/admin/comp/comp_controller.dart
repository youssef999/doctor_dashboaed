

import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:get/get.dart';

class CompController extends GetxController{

  List<Map<String,dynamic>> data=[];
  RxString search = ''.obs;
  Map<String,dynamic>numData={};

//https://easy-systems.net/doctors/admin/get_nums.php

  Future<void> getData() async {
    print("GET DATA");
    // Base64 encoded username and password
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('realStateApp:realStateApp2024'));

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': basicAuth, // Authorization header with Basic Auth
    };

    var url = Uri.parse('https://easy-systems.net/doctors/admin/get_comp.php');

    // Make the GET request
    try {
      var response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        print("Response: 200 OK");
        var jsonResponse = jsonDecode(response.body);

        // Check if the response is successful and contains data
        if (jsonResponse['success'] == true && jsonResponse['data'] != null) {
          // Assign the data from the response to your list
          data = List<Map<String, dynamic>>.from(jsonResponse['data']);
          update();
          print("Data fetched successfully: $data");
        } else {
          print("Error: No data found or response was not successful");
        }
      } else {
        print("Error: ${response.statusCode} ${response.reasonPhrase}");
      }
    } catch (e) {
      print("Exception: $e");
    }

  }


  Future<void> getNumData() async {
    print("GET .......NUM.... DATA");

    // Base64 encoded username and password
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('realStateApp:realStateApp2024'));

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': basicAuth, // Authorization header with Basic Auth
    };

    var url = Uri.parse('https://easy-systems.net/doctors/admin/get_nums.php');

    try {
      var response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        print("Response: 200 OK");
        var jsonResponse = jsonDecode(response.body);

        if (jsonResponse['success'] == true && jsonResponse['data'] != null) {
          // Check if 'data' is a Map
          if (jsonResponse['data'] is Map<String, dynamic> || jsonResponse['data'] is Map<String, String>) {

            print("xxx");
            numData = jsonResponse['data']; // Assign the map directly
          } else if (jsonResponse['data'] is List) {

            print("yyyy");
            //numData = List<Map<String, dynamic>>.from(jsonResponse['data']);
          }

          update(); // Update the state
          print("Data fetched successfully: $numData");
        } else {
          print("Error: No data found or response was not successful");
        }
      } else {
        print("Error: ${response.statusCode} ${response.reasonPhrase}");
      }
    } catch (e) {
      print("Exception: $e");
    }
  }





}