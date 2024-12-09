

 import 'package:doctor/core/const/app_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../views/admin_view.dart';

class LoginController extends GetxController{


  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();



  adminLogin(){
    final box=GetStorage();
        print("xxxx${emailController.text} ${passwordController.text}");

       if(emailController.text=='adminAli1932@hotmail.com'&&passwordController.text=='doctor2024Admin123'){
         Get.offAll(AdminView());
         box.write('login', true);
       }else{
         appMessage(text: 'بيانات الدخول غير صحيحة', fail: true);
       }
  }
}