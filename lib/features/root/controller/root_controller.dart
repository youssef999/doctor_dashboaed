// ignore_for_file: unused_local_variable, unused_import, avoid_print

//import 'dart:ffi';

import 'package:doctor/core/resources/app_strings.dart';
import 'package:doctor/features/auth/controllers/auth_controller.dart';
import 'package:doctor/features/auth/views/login_view.dart';
import 'package:doctor/features/auth/views/reset.dart';
import 'package:doctor/features/chats/view/chats_view.dart';
import 'package:doctor/features/doctor/appointDoc/view/appointDoc_view.dart';
import 'package:doctor/features/doctor/home/controllers/homeDoctor_controller.dart';
import 'package:doctor/features/doctor/home/views/homeDoctor_view.dart';
import 'package:doctor/features/more/view/more_view.dart';
import 'package:doctor/features/profile/view/profile_view.dart';
import 'package:doctor/features/settings/views/settings_view.dart';
import 'package:doctor/features/user/appointments/view/appointment_view.dart';
import 'package:doctor/features/user/doctorUser/controller/doctor_controller.dart';
import 'package:doctor/features/user/doctorUser/view/doctor_view.dart';
import 'package:doctor/features/user/home/controllers/home_controller.dart';
import 'package:doctor/features/user/home/views/home_view.dart';
import 'package:doctor/models/doctor_model.dart';
import 'package:doctor/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class RootController extends GetxController {
  RxInt selectedIndex = 0.obs;

  final users = Users().obs;
String? roleId;
  List page = [];
  @override
  void onInit() {
    super.onInit();
    //final users = Users().obs;
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => HomeDoctorController());
    // Get.put(()=>DoctorController());

    var box = GetStorage();
 
    try {
      roleId = box.read('roleId')??'0';

    } catch (e) {
      print(e);
    }

    roleId == '0' 
    
    //|| roleId == '1'
        ? page = [
            const HomeView(),
            const AppointmentView(),
            const ChatsView(),
            const MoreView(),
          ]
        : page = [
            const HomeDoctorView(),
            const AppointmentDoctorView(),
            const ChatsView(),
            const MoreView(),
          ];
  }

  void selectedPage(int index) {
    selectedIndex.value = index;
  }
}
