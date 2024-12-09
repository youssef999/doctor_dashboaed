

import 'dart:convert';

import 'package:doctor/core/const/app_message.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;

class DocController extends GetxController{




  List<dynamic> doctorData=[];


  deleteDoctor(int id) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Basic cmVhbFN0YXRlQXBwOnJlYWxTdGF0ZUFwcDIwMjQ='
    };
    var request = http.Request('POST',
        Uri.parse('https://easy-systems.net/doctors/admin/delete_doctor.php'));
    request.body = json.encode({
      "id": id
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      appMessage(text: 'تم الحذف بنجاح', fail: false);
      getDoctors();
    }
    else {
      print(response.reasonPhrase);
    }
  }
  RxString search = ''.obs;

  Future<void> getDoctors() async {
    print("HERE USER DATA");
  var headers = {
    'Authorization': 'Basic cmVhbFN0YXRlQXBwOnJlYWxTdGF0ZUFwcDIwMjQ='
  };

  var request = http.Request('GET', Uri.parse('https://easy-systems.net/doctors/admin/get_doctors.php'));
  request.body = ''''''; // Optional: Remove if not required
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
     doctorData= List<dynamic>.from(jsonData['data']);
     update();
      // Print the parsed user data
      print('Parsed User Data: $doctorData');
    } catch (e) {
      print("200");
      print('Error parsing JSON: $e');
    }
  } else {
    print('Error: ${response.reasonPhrase}');
  }
}


}