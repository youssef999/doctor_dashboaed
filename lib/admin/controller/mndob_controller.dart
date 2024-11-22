

import 'dart:convert';
import 'package:doctor/core/const/app_message.dart';
import 'package:http/http.dart'as http;
import 'package:get/get.dart';

class MndobController extends GetxController{


List<Map<String,dynamic>> data=[];

deleteMndob(int id) async {
  var headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Basic cmVhbFN0YXRlQXBwOnJlYWxTdGF0ZUFwcDIwMjQ='
  };
  var request = http.Request('POST',
      Uri.parse('https://easy-systems.net/doctors/admin/delete_mndob.php'));
  request.body = json.encode({
    "id": id
  });
  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();
  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
    appMessage(text: 'تم الحذف بنجاح', fail: false);
    getData();
  }
  else {
    print(response.reasonPhrase);
  }
}




 Future<void> getData() async {
  print("GET DATA");
  // Base64 encoded username and password
  String basicAuth = 'Basic ' + base64Encode(utf8.encode('realStateApp:realStateApp2024'));

  var headers = {
    'Content-Type': 'application/json',
    'Authorization': basicAuth, // Authorization header with Basic Auth
  };

  var url = Uri.parse
  ('https://easy-systems.net/doctors/admin/get_mndob.php');

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
 

}