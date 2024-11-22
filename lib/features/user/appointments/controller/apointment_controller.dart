import 'package:doctor/core/resources/app_strings.dart';
import 'package:doctor/core/widgets/custom_loading.dart';
import 'package:doctor/models/booking_model.dart';
import 'package:doctor/models/doctor_model.dart';
import 'package:doctor/models/user_model.dart';
import 'package:doctor/repositories/user_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AppointmentController extends GetxController {
  late UserRepository userRepository;

  RxList<Booking> book = <Booking>[].obs;
  RxList<Doctor> doctor = <Doctor>[].obs;
String docid = '0';
  AppointmentController() {
    userRepository = UserRepository();
  }

  final users = Users().obs;

  @override
  void onInit() async {
    try {
      final box = GetStorage();
      users.value =
          Users.fromJson(box.read('current_user') ?? <String, dynamic>{});
      Ui.logError('banm111111 ${users.value}');
      docid = users.value.id??'';
      myBooking(users.value.id ?? '');
    } catch (e) {
      print(e);
    }
    // await data();
    super.onInit();
  }

  Future<void> myBooking(String userId) async {
    print("BUILDINGSSSSS................"+userId);
    book.value=[];
    doctor.value=[];
    try {
      CustomLoading.showLoading('جاري التحميل .... ');
      Ui.logSuccess('start $userId');
      book.value = await userRepository.getBooking(userId);
      update();
      final box = GetStorage();
      var x = box.read('booking');
      doctor.value = x
          .map<Doctor>((obj) => Doctor.fromJson(obj))
          .toList();
      Ui.logSuccess('zxxcXXXXXXXXXX $doctor');
      CustomLoading.cancelLoading();
    } catch (e) {
      print(e);
    }
  }

    Future<void> removeBooking(String userBookId) async {
    print("//////////////removeBooking................");
    try {
      CustomLoading.showLoading('Loading');
      Ui.logSuccess('start $userBookId');
      bool x = await userRepository.removeBooking(userBookId);
     // Ui.logSuccess('removeBooking ${booking}');
      CustomLoading.cancelLoading();
      if (x) {
        Get.showSnackbar(Ui.SuccessSnackBar(message: 'Successful'));
        myBooking(docid);
       // getUsersBooking(docid ?? 0);
      } else {
        Get.showSnackbar(Ui.ErrorSnackBar(message: 'Contact Support'));
      }
    } catch (e) {
      Get.showSnackbar(Ui.ErrorSnackBar(message: 'Contact Support'));
      print(e);
      CustomLoading.cancelLoading();
    }
  }
}
