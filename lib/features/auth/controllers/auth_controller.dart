//import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:doctor/core/resources/app_strings.dart';
import 'package:doctor/core/widgets/custom_loading.dart';
import 'package:doctor/models/doctor_model.dart';
import 'package:doctor/models/user_model.dart';
import 'package:doctor/repositories/user_storage.dart';
import 'package:doctor/routes/app_routes.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart'as http;
import 'package:location/location.dart';

class AuthController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController checkPassController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController empCatController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  final box = GetStorage();
  final doctor = Doctor().obs;
  RxBool radioGen = true.obs;
  bool loading = false;
 // FirebaseAuth auth = FirebaseAuth.instance;
  //FirebaseFirestore firestore = FirebaseFirestore.instance;
  Rx<int> isSelected = 1.obs;

  GlobalKey<FormState>? loginFormKey;
  RxString roleId = '1'.obs;

  Location location = Location();
  PermissionStatus? _permissionGranted;

  Future<void> getLocationPermission() async {
    _permissionGranted = await location.requestPermission();
    //  print("PER====" + _permissionGranted.toString());
    if (_permissionGranted == PermissionStatus.granted) {
      await location.requestPermission();
      print("Done");
    }
  }

  @override
  void onInit() async {
    try {
      roleId.value = box.read('roleId');
    } catch (e) {
      print(e);
    }
    print('AUTH ROLE IS ${roleId}');
  //  getDeviceToken();
    super.onInit();
  }

  final users = Users().obs;

  final List<String> catNames = [];

  late UserRepository userRepo;
  AuthController() {
    userRepo = UserRepository();
  }

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
    'انف و اذن',
    'كبد',
    'جراحة عامة',
    'علاج طبيعي',
    'معامل تحاليل',
  ].obs;

  RxString selectedCategories = 'اسنان'.obs;

  final RxList<String> selectedListCategory = <String>[].obs;

  changeFilterArea(String value) {
    selectedBranch.value = value;
    update();
  }

///////////////////////////

  final RxList<String> firstBranch = [
    "1اسنان",
    "2اسنان",
    "3اسنان",
  ].obs;

  final RxList<String> secondBranch = [
    "1العصابية",
    "2العصابية",
    "3العصابية",
  ].obs;
  final RxList<String> thirdBranch = [
    "1باطنة",
    "2باطنة",
    "3باطنة",
  ].obs;
  final RxList<String> forthBranch = [
    "1قلب",
    "2قلب",
    "3قلب",
    "4قلب",
  ].obs;
  final RxList<String> fifthBranch = [
    "1عيون",
    "2عيون",
    "3عيون",
  ].obs;
  final RxList<String> sixthBranch = [
    '1نساء وتوليد',
    '2نساء وتوليد',
    '3نساء وتوليد',
  ].obs;

  final RxList<String> sevenBranch = [
    "1عظام",
    "2عظام",
    "3عظام",
  ].obs;

  final RxList<String> eightBranch = [
    "1اطفال",
    "2اطفال",
    "3اطفال",
  ].obs;
  final RxList<String> nineBranch = [
    "1اورام",
    "2اورام",
    "3اورام",
  ].obs;
  final RxList<String> tenBranch = [
    "1تغذية",
    "2تغذية",
    "3تغذية",
    "4تغذية",
  ].obs;
  final RxList<String> elevenBranch = [
    '1انف واذن وحنجرة',
    '2انف واذن وحنجرة',
    '3انف واذن وحنجرة',
  ].obs;
  final RxList<String> twelveBranch = [
    '1كبد',
    '2كبد',
    '3كبد',
  ].obs;
  final RxList<String> thirteenBranch = [
    '1جراحة عامة',
    '2جراحة عامة',
    '3جراحة عامة',
  ].obs;

  final RxList<String> fourteenBranch = [
    '1علاج طبيعي واصابات ملاعب',
    '2علاج طبيعي واصابات ملاعب',
    '3علاج طبيعي واصابات ملاعب',
  ].obs;
  final RxList<String> fifteenBranch = [
    '1معامل تحاليل',
    '2معامل تحاليل',
    '3معامل تحاليل',
  ].obs;

  RxString selectedBranch = '1اسنان'.obs;

  changeFilterCategory(String value) {
    selectedCategories.value = value;
    if (selectedCategories.value == 'اسنان') {
      selectedListCategory.value = firstBranch;

      selectedBranch.value = '2اسنان';
      doctor.value.secoundCat = selectedBranch.value;
    } else if (selectedCategories.value == 'العصابية') {
      selectedListCategory.value = secondBranch;
      selectedBranch = "2العصابية".obs;
      doctor.value.secoundCat = selectedBranch.value;
    } else if (selectedCategories.value == 'باطنة') {
      selectedListCategory.value = thirdBranch;
      selectedBranch = "2باطنة".obs;
      doctor.value.secoundCat = selectedBranch.value;
    } else if (selectedCategories.value == 'قلب') {
      selectedListCategory.value = forthBranch;
      selectedBranch = "2قلب".obs;
      doctor.value.secoundCat = selectedBranch.value;
    } else if (selectedCategories.value == 'عيون') {
      selectedListCategory.value = fifthBranch;
      selectedBranch = "2عيون".obs;
      doctor.value.secoundCat = selectedBranch.value;
    } else if (selectedCategories.value == 'نساء وتوليد') {
      selectedListCategory.value = sixthBranch;
      selectedBranch = '2نساء وتوليد'.obs;
      doctor.value.secoundCat = selectedBranch.value;
    } else if (selectedCategories.value == 'عظام') {
      selectedListCategory.value = sevenBranch;
      selectedBranch = "2عظام".obs;
      doctor.value.secoundCat = selectedBranch.value;
    } else if (selectedCategories.value == 'اطفال') {
      selectedListCategory.value = eightBranch;
      selectedBranch = "2اطفال".obs;
      doctor.value.secoundCat = selectedBranch.value;
    } else if (selectedCategories.value == 'اورام') {
      selectedListCategory.value = nineBranch;
      selectedBranch = "2اورام".obs;
      doctor.value.secoundCat = selectedBranch.value;
    } else if (selectedCategories.value == 'تغذية') {
      selectedListCategory.value = tenBranch;
      selectedBranch = "2تغذية".obs;
      doctor.value.secoundCat = selectedBranch.value;
    } else if (selectedCategories.value == 'انف و اذن') {
      selectedListCategory.value = elevenBranch;
      selectedBranch = '2انف واذن وحنجرة'.obs;
      doctor.value.secoundCat = selectedBranch.value;
    } else if (selectedCategories.value == 'كبد') {
      selectedListCategory.value = twelveBranch;
      selectedBranch = "2كبد".obs;
      doctor.value.secoundCat = selectedBranch.value;
    } else if (selectedCategories.value == 'جراحة عامة') {
      selectedListCategory.value = thirteenBranch;
      selectedBranch = '2جراحة عامة'.obs;
      doctor.value.secoundCat = selectedBranch.value;
    } else if (selectedCategories.value == 'علاج طبيعي') {
      selectedListCategory.value = fourteenBranch;
      selectedBranch = '2علاج طبيعي واصابات ملاعب'.obs;
      doctor.value.secoundCat = selectedBranch.value;
    } else if (selectedCategories.value == 'معامل تحاليل') {
      selectedListCategory.value = fifteenBranch;
      selectedBranch = '2معامل تحاليل'.obs;
      doctor.value.secoundCat = selectedBranch.value;
    }
    update();
  }

  Rx<bool> isChecked = false.obs;

  bool isLoading = false;

  String token = '';

  
  // getDeviceToken() async {
  //   final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  //   await _firebaseMessaging.requestPermission();
  //   // Get the device token
  //   token = (await _firebaseMessaging.getToken())!;
  // }

  Future<void> userLogin() async {
   

    try {
      var box = GetStorage();

      users.value = await userRepo.login(users.value);
      Ui.logError('ttttttttttttttkkkkkkkkkk2222 ${users.value}');
      Get.showSnackbar(Ui.SuccessSnackBar(message: 'Welcome back'));
      Get.toNamed(Routes.ROOT);

      box.write('current_user', users.value.toJson());
      box.write('roleId', '0');
    box.write('email','userEmail');

      Ui.logSuccess('ttttttttttttttkkkkkkkkkk2222 ${users.value}');
    } catch (e) {
      CustomLoading.cancelLoading();
      update();

      print("E====$e");
    }
  }

  Future<void> userLoginDoctor() async {
    CustomLoading.showLoading('Signing In');

    try {
      var box = GetStorage();

      doctor.value = await userRepo.loginDoctor(doctor.value);
      Ui.logError('ttttttttttttttkkkkkkkkkk2222 ${doctor.value}');
      Get.showSnackbar(Ui.SuccessSnackBar(message: 'Welcome back'));
      Get.toNamed(Routes.ROOT);
      box.write('current_doctor', doctor.value.toJson());
       box.write('roleId', '1');
           box.write('email','doctorEmail');
      Ui.logSuccess('ttttttttttttttkkkkkkkkkk2222 ${doctor.value}');
    } catch (e) {
      CustomLoading.cancelLoading();

      update();

      print("E====$e");
    }
  }

  Future<void> userSignUp() async {
    try {
      CustomLoading.showLoading('Loading');

      Ui.logError('ttttttttttttttkkkkkkkkkk2222 ${users.value}');
      bool x = await userRepo.register(users.value);
      if (x) {
        Get.showSnackbar(Ui.SuccessSnackBar(message: 'Now Sign In'));
        Get.toNamed(Routes.LOGIN);
      }
    } catch (e) {
      CustomLoading.cancelLoading();
      print(e);
    }
    //  loading = false;
    update();
  }

  Future<void> userSignUpDoctor() async {
    try {
      CustomLoading.showLoading('Loading');
      doctor.value.cat ?? (doctor.value.cat = 'اسنان');
      doctor.value.secoundCat ?? (doctor.value.secoundCat = '2اسنان');
      doctor.value.gender ?? (doctor.value.gender = 'male');

      Ui.logError('ttttttttttttttkkkkkkkkkk2222 ${doctor.value}');
      bool x = await userRepo.registerDoctor(doctor.value);
      if (x) {
        Get.showSnackbar(Ui.SuccessSnackBar(message: 'Now Sign In'));
        Get.toNamed(Routes.LOGIN);
      }
      CustomLoading.cancelLoading();
    } catch (e) {
      CustomLoading.cancelLoading();
      print(e);
    }
    //  loading = false;
    update();
  }
  // showIdDialogBox(BuildContext context) {
  //   return showDialog(
  //       context: context,
  //       builder: (context) {
  //         return SimpleDialog(
  //           backgroundColor: Colors.white,
  //           title: Custom_Text(
  //             text: 'camera'.tr,
  //             alignment: Alignment.center,
  //             fontSize: 19,
  //             color: Colors.black,
  //           ),
  //           children: [
  //             SimpleDialogOption(
  //               child: Custom_Text(
  //                 text: 'gallery'.tr,
  //                 alignment: Alignment.center,
  //                 fontSize: 14,
  //                 color: Colors.black,
  //               ),
  //               onPressed: () {
  //                 captureImage();
  //               },
  //             ),
  //             SimpleDialogOption(
  //                 child: Custom_Text(
  //                   text: 'selectImage'.tr,
  //                   alignment: Alignment.center,
  //                   fontSize: 14,
  //                   color: Colors.black,
  //                 ),
  //                 onPressed: () {
  //                   pickImage();
  //                 }),
  //             SimpleDialogOption(
  //                 child: Custom_Text(
  //                   text: 'cancel'.tr,
  //                   alignment: Alignment.center,
  //                   fontSize: 14,
  //                   color: Colors.red,
  //                 ),
  //                 onPressed: () {
  //                   Get.back();
  //                 })
  //           ],
  //         );
  //       });
  // }

  // showProfileDialogBox(BuildContext context) {
  //   return showDialog(
  //       context: context,
  //       builder: (context) {
  //         return SimpleDialog(
  //           backgroundColor: Colors.white,
  //           title: Custom_Text(
  //             text: 'camera'.tr,
  //             alignment: Alignment.center,
  //             fontSize: 19,
  //             color: Colors.black,
  //           ),
  //           children: [
  //             SimpleDialogOption(
  //               child: Custom_Text(
  //                 text: 'gallery'.tr,
  //                 alignment: Alignment.center,
  //                 fontSize: 14,
  //                 color: Colors.black,
  //               ),
  //               onPressed: () {
  //                 captureImage();
  //               },
  //             ),
  //             SimpleDialogOption(
  //                 child: Custom_Text(
  //                   text: 'selectImage'.tr,
  //                   alignment: Alignment.center,
  //                   fontSize: 14,
  //                   color: Colors.black,
  //                 ),
  //                 onPressed: () {
  //                   pickImage();
  //                 }),
  //             SimpleDialogOption(
  //                 child: Custom_Text(
  //                   text: 'cancel'.tr,
  //                   alignment: Alignment.center,
  //                   fontSize: 14,
  //                   color: Colors.red,
  //                 ),
  //                 onPressed: () {
  //                   Get.back();
  //                 })
  //           ],
  //         );
  //       });
  // }

  // showDialogBox(BuildContext context) {
  //   return showDialog(
  //       context: context,
  //       builder: (context) {
  //         return SimpleDialog(
  //           backgroundColor: Colors.white,
  //           title: const Custom_Text(
  //             text: 'الصورة ',
  //             alignment: Alignment.center,
  //             fontSize: 19,
  //             color: Colors.black,
  //           ),
  //           children: [
  //             SimpleDialogOption(
  //               child: const Custom_Text(
  //                 text: 'كاميرا ',
  //                 alignment: Alignment.center,
  //                 fontSize: 14,
  //                 color: Colors.black,
  //               ),
  //               onPressed: () {
  //                 captureImage();
  //               },
  //             ),
  //             SimpleDialogOption(
  //                 child: const Custom_Text(
  //                   text: ' اختر صورة  ',
  //                   alignment: Alignment.center,
  //                   fontSize: 14,
  //                   color: Colors.black,
  //                 ),
  //                 onPressed: () {
  //                   pickImage();
  //                 }),
  //             SimpleDialogOption(
  //                 child: const Custom_Text(
  //                   text: 'الغاء  ',
  //                   alignment: Alignment.center,
  //                   fontSize: 14,
  //                   color: Colors.red,
  //                 ),
  //                 onPressed: () {
  //                   Get.back();
  //                 })
  //           ],
  //         );
  //       });
  // }
}
