import 'dart:convert';
import 'dart:io';

//import 'package:get_storage/get_storage.dart';
import 'package:doctor/core/resources/app_strings.dart';
import 'package:doctor/core/widgets/custom_loading.dart';
import 'package:doctor/models/clinics.dart';
import 'package:doctor/models/doctor_model.dart';
import 'package:doctor/models/user_model.dart';
import 'package:doctor/repositories/user_storage.dart';
import 'package:doctor/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  // RxMap<String, dynamic> meUser = <String, dynamic>{}.obs;
  // String? roleId ;
//  Map<String, dynamic> meUser = {};
  String imageLink = '';
  List<XFile>? pickedImageXFiles;

  late UserRepository userRepository;

  ProfileController() {
    userRepository = UserRepository();
  }

  uploadImageToServer2(String imagePath) async {
    print("imagepath===$imagePath");
    try {
      // Read image file as bytes
      File imageFile = File(imagePath);
      List<int> imageBytes = await imageFile.readAsBytes();
      // Encode image bytes to base64
      String base64Image = base64Encode(imageBytes);

      // Prepare POST request body
      Map<String, String> requestBody = {
        'image': base64Image,
      };
      // Send POST request to Imgur API
      final response = await http.post(
        Uri.parse('https://api.imgur.com/3/image'),
        headers: {
          'Authorization': "Client-ID " + "fb8a505f4086bd5",
          //'Client-ID $clientId',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(requestBody),
      );
      // Check if the request was successful
      if (response.statusCode == 200) {
        print("IMAGE200");
        // Parse response JSON
        Map<String, dynamic> responseData = jsonDecode(response.body);
        // Check if upload was successful
        if (responseData.containsKey('data') &&
            responseData['data'].containsKey('link')) {
          print(responseData['data']['link']);
          imageLink = responseData['data']['link'];
          // Image uploaded successfully
          return responseData['data']['link'];
        } else {
          print("ELSEEE IMAGE");
          // Image upload failed
          throw ('Image upload failed: ${response.body}');
        }
      } else {
        // Request failed
        print("ELSEEE 2222 IMAGE");
        throw ('Failed to upload image: ${response.statusCode}');
      }
    } catch (e) {
      // Handle errors
      print('Error uploading image: $e');
      return 'eee';
    }
  }

  RxString roleId = '0'.obs;
  @override
  void onInit() async {
    //var box = GetStorage();
    //  Get.put(()=>DoctorController());
    try {
      final box = GetStorage();
      doctor.value =
          Doctor.fromJson(box.read('current_doctor') ?? <String, dynamic>{});
      Ui.logError('banm111111 doctor ${doctor.value}');
      users.value =
          Users.fromJson(box.read('current_user') ?? <String, dynamic>{});
      Ui.logError('banm111111 users ${doctor.value}');
      roleId.value = box.read('roleId');

      await getClinic(doctor.value.docId ?? '0');
    } catch (e) {
      print(e);
    }
    // Doctor();
    //await getDoctors();
    super.onInit();
  }

  final doctor = Doctor().obs;
  final clinic = Clinics().obs;
  final RxList<String> categories = [
    'اسنان',
    'العصابية',
    'باطنة',
    'قلب',
    'عيون',
    'نساء وتوليد',
    'عظام',
    'اطفال',
    'اورام',
    'تغذية',
    'انف واذن وحنجرة',
    'كبد',
    'جراحة عامة',
    'علاج طبيعي واصابات ملاعب',
    'معامل تحاليل',
  ].obs;

  RxString selectedCategories = 'اسنان'.obs;
  changeFilterCategory(String value) {
    selectedCategories.value = value;
    update();
  }

  Future<void> editProfileDoctor() async {
    print("edit Profile Doctor................");
    try {
      CustomLoading.showLoading('جاري التحميل ....');
      Ui.logSuccess('start $doctor');
      await userRepository.editProfileDoctor(doctor.value);
      Ui.logSuccess('Profile ${doctor}');
      Get.offAll(Routes.ROOT);
     // Get.toNamed(Routes.LOGIN);
      CustomLoading.cancelLoading();
    } catch (e) {
      print(e);
    }
  }

  Future<void> editProfile() async {
    print("edit Profile................");
    try {
      CustomLoading.showLoading('Loading');
      Ui.logSuccess('start $users');
      await userRepository.editProfile(users.value);
      Ui.logSuccess('Profile ${users}');
      Get.toNamed(Routes.LOGIN);
      CustomLoading.cancelLoading();
    } catch (e) {
      print(e);
    }
  }

  Future<void> editClinic() async {
    print("clinicXXXX................");
    try {
      CustomLoading.showLoading('Loading');
      Ui.logSuccess('start $clinic');
      await userRepository.editClinic(clinic.value);
      Ui.logSuccess('clinicXXXX ${clinic}');
      Get.toNamed(Routes.LOGIN);
      CustomLoading.cancelLoading();
    } catch (e) {
      print(e);
    }
  }

  Future<void> getClinic(String id) async {
    print("get clinicXXXX................");
    try {
      //   CustomLoading.showLoading('Loading');
      Ui.logSuccess('start $clinic');
      clinic.value = await userRepository.getClinics(id);
      Ui.logSuccess('get clinicXXXX ${clinic}');
      //  Get.toNamed(Routes.LOGIN);
      //  CustomLoading.cancelLoading();
    } catch (e) {
      print(e);
    }
  }

  final ImagePicker _picker = ImagePicker();
  pickMultiImage() async {
    pickedImageXFiles = await _picker.pickMultiImage(
      imageQuality: 100,
    );
    update();
  }

  // String? id;
  final users = Users().obs;

  Future<void> deleteAccount() async {
    print("Delete Users................");
    try {
      CustomLoading.showLoading('Loading');
      //Ui.logSuccess('start ${id}');

      // bool x
      // = await userRepository.deleteUser(id!);
      // if (x) {
      //   Get.showSnackbar(
      //       Ui.SuccessSnackBar(message: 'Account Deleted Successfully'));
      //   box.remove('current_user');
      //   Get.back();
      // } else {
      //   Get.showSnackbar(
      //       Ui.ErrorSnackBar(message: 'Contact Support To Delete'));
      // }
      //  Ui.logSuccess('zxxc ${build}');
      CustomLoading.cancelLoading();
    } catch (e) {
      print(e);
    }
  }

  Future<void> me() async {
    print("me Users................");
    try {
      // CustomLoading.showLoading('Loading');
      //users.value.image = imageLink.toString();
      // Ui.logSuccess('start ${users.value}');
      //   var box = GetStorage();
      users.value = await userRepository.me(users.value);

      Ui.logSuccess('zxxc ${users.value}');
      //CustomLoading.cancelLoading();
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateUser() async {
    print("Update Users................");
    try {
      CustomLoading.showLoading('Loading');
      users.value.image = imageLink.toString();
      Ui.logSuccess('start ${users.value}');
      //  var box = GetStorage();
      // bool x = await userRepository.updateUser(users.value);
      // if (x) {
      //   Get.showSnackbar(
      //       Ui.SuccessSnackBar(message: 'Account Updated Successfully'));
      //   //box.remove('current_user');
      //   Get.back();
      // } else {
      //   Get.showSnackbar(
      //       Ui.ErrorSnackBar(message: 'Contact Support To Update'));
      // }
      //  Ui.logSuccess('zxxc ${build}');
      CustomLoading.cancelLoading();
    } catch (e) {
      print(e);
    }
  }
}
