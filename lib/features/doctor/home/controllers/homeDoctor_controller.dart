import 'package:doctor/core/resources/app_strings.dart';
import 'package:doctor/models/clinics.dart';
import 'package:doctor/models/doctor_model.dart';
import 'package:doctor/repositories/user_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeDoctorController extends GetxController {


  Rx<Doctor> doctor = Doctor().obs;
  late UserRepository userRepository;
  Rx<Clinics> clinic = Clinics().obs;

  HomeDoctorController() {
    userRepository = UserRepository();
  }

  @override
  void onInit() async {
    //var box = GetStorage();
    //  Get.put(()=>DoctorController());
    try {
      final box = GetStorage();
      doctor.value =
          Doctor.fromJson(box.read('current_doctor') ?? <String, dynamic>{});
      Ui.logError('banm111111 ${doctor.value}');
      await getClinics(doctor.value.docId??'0');
    } catch (e) {
      print(e);
    }
    // Doctor();
    //await getDoctors();
    super.onInit();
  }




  Future<void> getClinics(String doctorId) async {
    print("clinicXXXX................");
    try {
      //   CustomLoading.showLoading('Loading');
      Ui.logSuccess('start $doctorId');
      clinic.value = await userRepository.getClinics(doctorId);
      Ui.logSuccess('clinicXXXX ${clinic}');
      //  CustomLoading.cancelLoading();
    } catch (e) {
      print(e);
    }
  }
}
