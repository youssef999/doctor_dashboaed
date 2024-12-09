import 'package:doctor/core/resources/app_colors.dart';
import 'package:doctor/core/resources/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AppValidations {
  // Validator for email
  static RxBool isValid = false.obs;
  static String? emailValidator(String? value) {
    Ui.logError('Validating Email $value');
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    if (!emailRegex.hasMatch(value!)) {
      return 'enterRightEmail'.tr;
    } 
    //else {
      return null;
    //}
  }

  // Validator for phone number (accepts both Arabic and English numerals, 11-15 digits)
  static String? phoneValidator(String? value) {
    Ui.logError('Validating Phone');

    final phoneRegex = RegExp(r'^[0-9٠-٩]{11,15}$');
    if (value == null || value.isEmpty) {
      return 'enterRightPhone'.tr;
    } else if (!phoneRegex.hasMatch(value)) {
      return 'enterRightPhone'.tr;
    } 
    //else {
      return null;
    //}
  }

  // Validator for name (only Arabic and English letters, spaces, minimum length of 5)
  static String? nameValidator(String? value) {
    Ui.logError('Validating Name');
    final nameRegex = RegExp(r'^[a-zA-Zء-ي\s]{5,}$');

    if (value == null || value.isEmpty) {
      return 'enterRightName'.tr;
    } else if (!nameRegex.hasMatch(value)) {
      return 'enterRightName'.tr;
    }
  //   else {
      return null;
    
  }

  // Validator for password (min 8 chars, at least 1 Arabic/English letter, 1 Arabic/English digit, and 1 special character)
  static String? passwordValidator(String? value) {
    Ui.logError('Validating Pass');
    if (value == null || value.isEmpty) {
      return 'enterRightPassword'.tr;
    } else if (value.length < 6) {
      return 'enterRightPassword'.tr;
  }
  // else {
      return null;
  //  }
  }

  static Future<bool?> showMessageBoxDelete(
      String title, String refuseText) async {
    return Get.dialog(
      AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.error,
              size: 50,
              color: Colors.red,
            ),
            //   SizedBox(height: 20),
            Text(
              title,
              style: GoogleFonts.cairo(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),

            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.back(result: true);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Colors.red),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  child: Text(
                    refuseText,
                    style: GoogleFonts.cairo(color: AppColors.whiteColor),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.back(result: false);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: AppColors.redColor),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  child: Text(
                    'Close'.tr,
                    style: GoogleFonts.cairo(color: AppColors.darkColor),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}