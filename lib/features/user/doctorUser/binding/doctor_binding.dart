import 'package:get/get.dart';
import 'package:doctor/features/user/doctorUser/controller/doctor_controller.dart';

class DoctorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DoctorController>(
      () => DoctorController(),
    );
  }
}
