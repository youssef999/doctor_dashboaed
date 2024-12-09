

 
 import 'package:doctor/Core/resources/app_colors.dart';
import 'package:doctor/admin/controller/login_controller.dart';
import 'package:doctor/core/widgets/Custom_button.dart';
import 'package:doctor/core/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminLogin extends StatelessWidget {
   const AdminLogin({super.key});
 
   @override
   Widget build(BuildContext context) {

     LoginController controller = Get.put(LoginController());
     return Scaffold(
       backgroundColor:Colors.white,
       appBar: AppBar(
         backgroundColor: AppColors.appBarColor,
         toolbarHeight: 72,
         title: Text('Admin Login',
         style:TextStyle(color: Colors.white,fontSize: 22),
         ),
       ),
       body:Padding(
         padding: const EdgeInsets.all(31.0),
         child: ListView(children: [
           Image.asset('assets/images/logo.png',height: 91,),
           SizedBox(height: 55,),
           CustomTextFormField(label: 'البريد الاكتروني',
               onChanged:(v){
                 controller.emailController.text = v!;
               },
               obs: false, controller: controller.emailController, hint: 'البريد الالكتروني '),
           SizedBox(height: 25,),
           CustomTextFormField(
               onChanged: (v){
                 controller.passwordController.text = v!;
               },
               label: 'كلمة المرور',

               obs: true, controller: controller.passwordController, hint: 'كلمة المرور ',

           ),
           SizedBox(height: 25,),
           Padding(
             padding: const EdgeInsets.only(left: 48.0,right: 48),
             child: CustomButton(
                 text: 'تسجبل الدخول', onPressed:(){
            controller.  adminLogin();

             }),
           )
         ],),
       ),
     );
   }
 }
 