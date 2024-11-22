import 'package:doctor/features/doctor/patients/controllers/patients_controller.dart';
import 'package:get/get.dart';


class PatientsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PatientsController>(
      () => PatientsController(),
    );
  }
}