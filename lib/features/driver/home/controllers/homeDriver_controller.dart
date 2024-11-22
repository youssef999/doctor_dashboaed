import 'package:doctor/core/resources/app_strings.dart';
import 'package:doctor/models/doctor_model.dart';
import 'package:get/get.dart';

class HomeDriverController extends GetxController {
  Rx<Doctor> doctor = Doctor().obs;
  List<String> secCat = [];
  @override
  void onInit() async {
    //var box = GetStorage();
    //  Get.put(()=>DoctorController());
    try {
      Ui.logSuccess('mmmmjjjtfyftgyh');

      Future.delayed(const Duration(milliseconds: 3)).then((v) {
        doctor.value = Get.arguments;
          doctor.value.secoundCat  = secCat;
        Ui.logSuccess(secCat);
      });
    } catch (e) {
      print(e);
    }
    // Doctor();
    //await getDoctors();
    super.onInit();
  }
}
