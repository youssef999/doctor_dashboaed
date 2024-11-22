import 'package:doctor/models/doctor_model.dart';
import 'package:doctor/models/user_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MoreController extends GetxController {
  Rx<Users> users = Users().obs;
  Rx<Doctor> doctor = Doctor().obs;
  List<String> secCat = [];
  RxString roleId = '1'.obs;
  @override
  void onInit() async {
       var box = GetStorage();

    try {
      roleId.value = box.read('roleId');
    print('FOXXXX $roleId');

    } catch (e) {
      print(e);
    }
    print('FOXXXX22 $roleId');
    // Doctor();
    //await getDoctors();
    super.onInit();
  }
 
}
