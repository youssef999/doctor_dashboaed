import 'package:doctor/core/resources/app_strings.dart';
import 'package:doctor/models/booking_model.dart';
import 'package:doctor/models/comment_model.dart';
import 'package:doctor/models/doctor_model.dart';
import 'package:doctor/models/user_model.dart';
import 'package:doctor/repositories/user_storage.dart';
import 'package:doctor/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DoctorController extends GetxController {
  Rx<Doctor> doctor = Doctor().obs;
  List<String> secCat = [];
  Rx<Booking> book = Booking().obs;
  Rx<Users> users = Users().obs;
  Rx<bool> isEdit = false.obs;
  String? docId;
  String? userId;
  String? bookId;
  String? email;
  late UserRepository userRepository;
  //late CategoryRepository categoryRepository;

  RxList<Comments> comments = <Comments>[].obs;

  DoctorController() {
    userRepository = UserRepository();
    //  categoryRepository = CategoryRepository();
  }

  @override
  void onInit() async {
    //var box = GetStorage();
    //  Get.put(()=>DoctorController());

    try {
      final box = GetStorage();
      Ui.logSuccess('mmmmjjjtfyftgyh');
      Future.delayed(const Duration(milliseconds: 3)).then((v) async {
        doctor.value = Get.arguments['doctor'];

        doctor.value.secoundCat = secCat;
        docId = doctor.value.docId;
        users.value =
            Users.fromJson(box.read('current_user') ?? <String, dynamic>{});
        Ui.logError('banm111111 ${users.value}');
        userId = users.value.userId;
        email = users.value.email;
        await getComments(doctor.value);
      });
    } catch (e) {
      print(e);
    }

    // Doctor();
    //await getDoctors();
    super.onInit();
  }

  Future<void> getComments(Doctor doc) async {
    print("COmments................");
    try {
      //CustomLoading.showLoading('Loading');
      Ui.logSuccess('starting COmments');

      comments.assignAll(await userRepository.docComments(doc));
      Ui.logSuccess('CCCCCOOOOOMMM $comments');
      //CustomLoading.cancelLoading();
    } catch (e) {
      print(e);
    }
  }

  Future<void> addBooking() async {
    print("COmments................");
    try {
      //CustomLoading.showLoading('Loading');
      book.value.doctorId = docId;
      book.value.userId = userId;
      book.value.email = email;
      Ui.logSuccess('starting booking ${book.value}');

      bool x = await userRepository.addBooking(book.value);
      if (x) {
        Get.toNamed(Routes.COMPLETED);
      } else {
        Get.showSnackbar(
            Ui.ErrorSnackBar(message: 'Please check with support'));
      }
      Ui.logSuccess('CCCCCOOOOOMMM $book');
      //CustomLoading.cancelLoading();
    } catch (e) {
      print(e);
    }
  }

  Future<void> editBooking() async {
    print("COmments................");
    try {
      //CustomLoading.showLoading('Loading');
      bookId = Get.arguments['bookId'];
      Ui.logError('ffjhvfkjf $bookId');
      book.value.email = email;
      book.value.id = bookId;
      Ui.logSuccess('starting booking ${book.value}');

      bool x = await userRepository.editBooking(book.value);
      if (x) {
        Get.toNamed(Routes.COMPLETED);
      } else {
        Get.showSnackbar(
            Ui.ErrorSnackBar(message: 'Please check with support'));
      }
      Ui.logSuccess('CCCCCOOOOOMMM $book');
      //CustomLoading.cancelLoading();
    } catch (e) {
      print(e);
    }
  }
}
