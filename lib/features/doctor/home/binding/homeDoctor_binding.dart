import 'package:doctor/features/doctor/home/controllers/homeDoctor_controller.dart';
import 'package:get/get.dart';


class HomeDoctorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeDoctorController>(
      () => HomeDoctorController(),
    );
  }
}