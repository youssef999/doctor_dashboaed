


 import 'package:doctor/admin/controller/user_controller.dart';
import 'package:doctor/core/widgets/Custom_button.dart';
import 'package:doctor/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class userDetailsView extends StatefulWidget {

  String id;
  userDetailsView({super.key,required this.id});

  @override
  State<userDetailsView> createState() => _userDetailsViewState();
}

class _userDetailsViewState extends State<userDetailsView> {

  UserController controller=Get.put(UserController());

  @override
  void initState() {

    controller.getUserId(int.parse(widget.id));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar('', context, false),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<UserController>(
          builder: (_) {


            if(controller.userDetails.isNotEmpty) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(21.0),
                  child: UserCardWidget(controller: controller,
                      user: controller.userDetails[0]),
                ),
              );
            }else{
              return const Center(child: CircularProgressIndicator());
            }


          }
        ),
      ),
    );
  }
}


 class UserCardWidget extends StatelessWidget {
   UserController controller;
   Map<String,dynamic>user;

   UserCardWidget({super.key, required this.controller,required this.user});


   @override
   Widget build(BuildContext context) {
     return GetBuilder<UserController>(
         builder: (_) {
           return Directionality(
             textDirection:TextDirection.rtl,
             child: InkWell(
               child: Container(
                 decoration:BoxDecoration(
                     borderRadius:BorderRadius.circular(13),
                     color:Colors.grey[100]
                 ),
                 child:Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Column(children: [
                     const SizedBox(height: 10),
                     Image.asset('assets/images/user2.png',height: 100,),
                     const SizedBox(height: 10),
                     Text("اسم المستخدم : "+user['name'],style: TextStyle(
                         color:Colors.black,fontSize: 18
                     ),),
                     const SizedBox(height: 10),
                     Text("بريد المستخدم : "+user['email'],style: TextStyle(
                         color:Colors.black,fontSize: 18
                     ),),
                     const SizedBox(height: 10),
                     Text("رقم الهاتف المستخدم : "+user['phone'],style: TextStyle(
                         color:Colors.black,fontSize: 18
                     ),),
                     const SizedBox(height: 10),

                     SizedBox(
                       width: 333,
                       child: CustomButton(
                           text: ' حذف المستخدم ', onPressed: (){
                         controller.deleteUser(int.parse(user['id']));
                       }),
                     ),

                     const SizedBox(height: 10),
                   ],),
                 ),
               ),
               onTap:(){
                 controller.deleteUser(user['id']);
               },
             ),
           );
         }
     );
   }
 }