import 'package:doctor/features/doctor/appointDoc/controller/appointDoc_controller.dart';
import 'package:get/get.dart';


class AppointmentDoctorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppointmentDoctorController>(
      () => AppointmentDoctorController(),
    );
 
  }
}