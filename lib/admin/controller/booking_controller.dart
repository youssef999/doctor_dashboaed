


import 'dart:convert';

import 'package:doctor/core/const/app_message.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;

class   BookingController extends GetxController{


List<Map<String,dynamic>> data=[];

  RxString search = ''.obs;

 Future<void> getData() async {
  print("GET DATA");
  // Base64 encoded username and password
  String basicAuth = 'Basic ' + base64Encode(utf8.encode('realStateApp:realStateApp2024'));

  var headers = {
    'Content-Type': 'application/json',
    'Authorization': basicAuth, // Authorization header with Basic Auth
  };

  var url = Uri.parse('https://easy-systems.net/doctors/admin/get_all_bokkings.php');

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


cancel(String id)async{
   print("ID==="+id);
  String basicUrl =
      'Basic cmVhbFN0YXRlQXBwOnJlYWxTdGF0ZUFwcDIwMjQ=';

  var headers = {
    'Content-Type': 'application/json',
    'Authorization': basicUrl,
  };
  var request = http.Request('POST', Uri.parse('https://easy-systems.net/doctors/doctors/cancel_booking.php'));
  request.body = json.encode({
    "booking_id": id
  });
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
    data=[];
    update();
    print("JSON="+response.toString());

    appMessage(text: 'تم الغا الحجز بنجاح ', fail: false);

    getData();
  }
  else {
    print(response.reasonPhrase);
  }

}


delete(String id)async{
  print("ID==="+id);
  String basicUrl =
      'Basic cmVhbFN0YXRlQXBwOnJlYWxTdGF0ZUFwcDIwMjQ=';

  var headers = {
    'Content-Type': 'application/json',
    'Authorization': basicUrl,
  };
  var request = http.Request('POST', Uri.parse('https://easy-systems.net/doctors/doctors/delete_book.php'));
  request.body = json.encode({
    "booking_id": id
  });
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
    data=[];
    update();
    print("JSON="+response.toString());

    appMessage(text: 'تم الحذف بنجاح  ', fail: false);

    getData();
  }
  else {
    print(response.reasonPhrase);
  }

}





 




}