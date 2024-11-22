import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:doctor/core/const/app_message.dart';
import 'package:doctor/core/resources/app_strings.dart';
import 'package:doctor/core/widgets/custom_loading.dart';
import 'package:doctor/models/booking_model.dart';
import 'package:doctor/models/doctor_model.dart';
import 'package:doctor/models/user_model.dart';
import 'package:doctor/repositories/user_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AppointmentDoctorController extends GetxController {
  late UserRepository userRepository;
  RxBool isSuccess = false.obs;
  RxList<Booking> booking = <Booking>[].obs;
  RxList<Doctor> doctor = <Doctor>[].obs;

  TextEditingController dateController=TextEditingController();
  TextEditingController timeController=TextEditingController();
    TextEditingController numberController=TextEditingController();


  int? docid;
  AppointmentDoctorController() {
    userRepository = UserRepository();
  }

  final users = Users().obs;
  final doc = Doctor().obs;
  @override
  void onInit() async {
    isSuccess.value = false;
    try {
      final box = GetStorage();
      doc.value =
          Doctor.fromJson(box.read('current_doctor') ?? <String, dynamic>{});
      Ui.logError('banm111111 ${doc}');
      docid = int.tryParse(doc.value.id ?? '0');
      getUsersBooking(int.tryParse(doc.value.id ?? '0') ?? 0);
    } catch (e) {
      print(e);
    }
    // await data();
    super.onInit();
  }


  SetAppointment(String time,String number)async{
    var headers = {
  'Content-Type': 'application/json',
  'Authorization': 'Basic cmVhbFN0YXRlQXBwOnJlYWxTdGF0ZUFwcDIwMjQ='
};
var data = json.encode({
  "id":int.tryParse(doc.value.id ?? '0'),
  "time": time,
  "number": number
});
var dio = Dio();
var response = await dio.request(
  'https://easy-systems.net/doctors/doctors/doctor_apointment.php',
  options: Options(
    method: 'POST',
    headers: headers,
  ),
  data: data,
);

if (response.statusCode == 200) {
  print(json.encode(response.data));
}
else {
  print(response.statusMessage);
}
  }
  



 changeBookingStatus(String id,String status) async {
var headers = {
  'Content-Type': 'application/json',
  'Authorization': 'Basic cmVhbFN0YXRlQXBwOnJlYWxTdGF0ZUFwcDIwMjQ='
};

var data = json.encode({
  "booking_id": id,
  "status": status
});
var dio = Dio();
var response = await dio.request(
  'https://easy-systems.net/doctors/doctors/edit_booking.php',
  options: Options(
    method: 'POST',
    headers: headers,
  ),
  data: data,
);

if (response.statusCode == 200) {
  print(json.encode(response.data));

  if(status=='Done'){
  Get.back();
  }
  appMessage(text: ' تم التاكيد ', fail: false);
  getUsersBooking(int.tryParse(doc.value.id ?? '0') ?? 0);
}
else {
  print(response.statusMessage);
}


 }


  Future<void> getUsersBooking(int doctorId) async {
    print("........Bookings................");
    try {
      CustomLoading.showLoading('جاري التحميل ....');
      Ui.logSuccess('start $doctorId');
      booking.assignAll(await userRepository.getUsersAppoint(doctorId));
      Ui.logSuccess('zxxcXXXXXXXXXX ${booking}');
      CustomLoading.cancelLoading();
    } catch (e) {
      print(e);
    }
  }
}

//searchByCat
//removeBooking
//editClinic
//editProfileDoctor