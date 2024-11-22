

import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart'as http;

class   AdminController extends GetxController{


List<Map<String,dynamic>> data=[];



 Future<void> getData() async {
  print("GET DATA");

  // Base64 encoded username and password
  String basicAuth = 'Basic ' + base64Encode(utf8.encode('realStateApp:realStateApp2024'));

  var headers = {
    'Content-Type': 'application/json',
    'Authorization': basicAuth,  // Authorization header with Basic Auth
  };

  var url = Uri.parse('https://easy-systems.net/doctors/doctors/get_cat.php');

  // Make the GET request
  try {
    var response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      print("Response: 200 OK");
      print(response.body);  // Print response data
    } else {
      print("Error: ${response.statusCode} ${response.reasonPhrase}");
    }
  } catch (e) {
    print("Exception: $e");
  }
}
 

// getData()async{
//   print("GET DATA");
//     String basicUrl =
//       'Basic cmVhbFN0YXRlQXBwOnJlYWxTdGF0ZUFwcDIwMjQ=';
//   var headers = {
//  'Content-Type': 'application/json',
//   //'Authorization': basicUrl,
//     'Authorization': basicUrl,
// };
// var request = http.Request('GET', Uri.parse('https://easy-systems.net/doctors/doc/get_doc_cat.php'));
// request.body = json.encode({
//   "cat": "طب اسنان"
// });
//   request.headers.addAll(headers);
// http.StreamedResponse response = await request.send();

// if (response.statusCode == 200) {
// print("200");
//   print(await response.stream.bytesToString());
// }
// else {
//   print("ERRROORORRRRRROROROROR........");
//   print(response.statusCode);
//   print(response.reasonPhrase);
//   print("ERRROORORRRRRROROROROR........");
// }
// }


}