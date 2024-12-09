
import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:get/get.dart';

class StController extends GetxController{



  int successData = 0;
  int refusedData = 0;
  int allData = 0;
  int pendingData = 0;



  int lastDaySuccessData = 0;
  int lastDayRefusedData = 0;
  int lastDayPendingData = 0;
  int lastDayTotal = 0;



  int lastMonthSuccessData = 0;
  int lastMonthRefusedData = 0;
  int lastMonthPendingData = 0;
  int lastMonthTotal = 0;


  int lastWeekSuccessData = 0;
  int lastWeekRefusedData = 0;
  int lastWeekPendingData = 0;
  int lastWeekTotal = 0;


  Future<void> getStData() async{
    var headers = {
      'Authorization': 'Basic cmVhbFN0YXRlQXBwOnJlYWxTdGF0ZUFwcDIwMjQ='
    };
    var request = http.Request(
        'GET', Uri.parse('https://easy-systems.net/doctors/admin/get_st_with_date.php'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // Decode the response JSON
      final responseBody = await response.stream.bytesToString();
      final Map<String, dynamic> jsonData = json.decode(responseBody);

      // Check if the response indicates success
      if (jsonData['success'] == true) {
        final data = jsonData['data'];

        // Update the variables
        pendingData = int.parse(data['pending_bookings']);
        successData = int.parse(data['successful_bookings']);
        refusedData = int.parse(data['refused_bookings']);
        allData = int.parse(data['total_bookings']);

        lastDayTotal = int.parse(data['total_last_day']);

        lastDayPendingData = int.parse(data['pending_last_day']);
        lastDaySuccessData = int.parse(data['successful_last_day']);

        lastDayRefusedData = int.parse(data['refused_last_day']);

        lastWeekPendingData = int.parse(data['pending_last_week']);
        lastWeekSuccessData = int.parse(data['successful_last_week']);
        lastWeekRefusedData = int.parse(data['refused_last_week']);
        lastWeekTotal= int.parse(data['total_last_week']);


        lastMonthPendingData = int.parse(data['pending_last_month']);
        lastMonthSuccessData = int.parse(data['successful_last_month']);
        lastMonthRefusedData = int.parse(data['refused_last_month']);
        lastMonthTotal = int.parse(data['total_last_month']);


        update();

        print('Total Bookings: $allData');
        print('Successful Bookings: $successData');
        print('Refused Bookings: $refusedData');
      } else {
        print('Error: Success flag is false');
      }
    } else {
      print('Error: ${response.reasonPhrase}');
    }
  }


  // Future<void> getTopDoctorData() async{
  //   var headers = {
  //     'Authorization': 'Basic cmVhbFN0YXRlQXBwOnJlYWxTdGF0ZUFwcDIwMjQ='
  //   };
  //   var request = http.Request(
  //       'GET', Uri.parse('https://easy-systems.net/doctors/admin/get_top.php'));
  //
  //   request.headers.addAll(headers);
  //
  //   http.StreamedResponse response = await request.send();
  //
  //   if (response.statusCode == 200) {
  //     // Decode the response JSON
  //     final responseBody = await response.stream.bytesToString();
  //     final Map<String, dynamic> jsonData = json.decode(responseBody);
  //
  //     // Check if the response indicates success
  //     if (jsonData['success'] == true) {
  //       final data = jsonData['data'];
  //
  //
  //       update();
  //
  //
  //     } else {
  //       print('Error: Success flag is false');
  //     }
  //   } else {
  //     print('Error: ${response.reasonPhrase}');
  //   }
  // }
  List<dynamic> doctorData=[];

  Future<void> getTopDoctors() async {
    print(".................HERE USER DATA..............");
    var headers = {
      'Authorization': 'Basic cmVhbFN0YXRlQXBwOnJlYWxTdGF0ZUFwcDIwMjQ='
    };

    var request = http.Request('GET', Uri.parse('https://easy-systems.net/doctors/admin/get_top.php'));
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
        doctorData = List<dynamic>.from(jsonData['data']);
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


  //


}
