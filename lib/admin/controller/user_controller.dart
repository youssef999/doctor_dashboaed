import 'dart:convert';

import 'package:doctor/core/const/app_message.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;

class UserController extends GetxController{




  List<dynamic> userData=[];
  List<dynamic> userDetails=[];
  RxString search = ''.obs;

  deleteUser(int id) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Basic cmVhbFN0YXRlQXBwOnJlYWxTdGF0ZUFwcDIwMjQ='
    };
    var request = http.Request('POST',
        Uri.parse('https://easy-systems.net/doctors/admin/delete_user.php'));
    request.body = json.encode({
      "id": id
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      appMessage(text: 'تم الحذف بنجاح', fail: false);
      getUserData();
    }
    else {
      print(response.reasonPhrase);
    }
  }

  Future<void> getUserData() async {
    print("HERE USER DATA");
  var headers = {
    'Authorization': 'Basic cmVhbFN0YXRlQXBwOnJlYWxTdGF0ZUFwcDIwMjQ='
  };

  var request = http.Request('GET', Uri.parse
    ('https://easy-systems.net/doctors/admin/get_users.php'));


  request.headers.addAll(headers);

  // Make the HTTP request and wait for the streamed response
  http.StreamedResponse response = await request.send();
  if (response.statusCode == 200) {
    print("200");
    // Convert the streamed response to a string
    String responseBody = await response.stream.bytesToString();
    // Parse the JSON data
    try {
      dynamic jsonData = json.decode(responseBody);
      print("JOSN DATA=="+jsonData.toString());
      // Decode the response to a list of dynamic
      // Convert the decoded data to List<Map<String, dynamic>>
     userData = List<dynamic>.from(jsonData['data']);
     update();
      // Print the parsed user data
      print('Parsed User Data: $userData');
    } catch (e) {
      print("200");
      print('Error parsing JSON: $e');
    }
  } else {
    print('Error: ${response.reasonPhrase}');
  }
}

getUserDetails(String userId)async{


  print("........HERE USER DATA.........===="+userId);
  var headers = {
    'Authorization': 'Basic cmVhbFN0YXRlQXBwOnJlYWxTdGF0ZUFwcDIwMjQ='
  };
  var request = http.Request('POST', Uri.parse
    ('https://easy-systems.net/doctors/admin/get_user_id.php'));
  json.encode({'id': userId});
  request.headers.addAll(headers);
  // Make the HTTP request and wait for the streamed response
  http.StreamedResponse response = await request.send();
  if (response.statusCode == 200) {
    print("200");
    // Convert the streamed response to a string
    String responseBody = await response.stream.bytesToString();
    // Parse the JSON data
    try {
      dynamic jsonData = json.decode(responseBody);
      print("JOSN DATA===="+jsonData.toString());
      // Decode the response to a list of dynamic
      // Convert the decoded data to List<Map<String, dynamic>>
      userDetails = List<dynamic>.from(jsonData['data']);
      update();
      // Print the parsed user data
      print('Parsed User Data: $userData');
    } catch (e) {
      print("200");
      print('Error parsing JSON: $e');
    }
  } else {
    print('Error: ${response.reasonPhrase}');
  }

}


  Future<List<dynamic>> getUserId(int id) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Basic cmVhbFN0YXRlQXBwOnJlYWxTdGF0ZUFwcDIwMjQ='
    };

    var request = http.Request(
      'POST', // Should be POST since you're sending a body
      Uri.parse('https://easy-systems.net/doctors/admin/get_user_id.php'),
    );

    request.body = json.encode({"id": id.toString()});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      try {
        Map<String, dynamic> jsonData = json.decode(responseBody);
        if (jsonData["success"] == true && jsonData.containsKey("data")) {
           userDetails = jsonData["data"];
          print('Parsed User Data: $userDetails');
          update();
          return userDetails;
        } else {
          print('No data found.');
          return [];
        }
      } catch (e) {
        print('Error parsing JSON: $e');
        return [];
      }
    } else {
      print('Error: ${response.reasonPhrase}');
      return [];
    }
  }

//get_user_id.php


}