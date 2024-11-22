

import 'package:doctor/admin/controller/booking_controller.dart';
import 'package:doctor/admin/controller/mndob_controller.dart';
import 'package:doctor/admin/controller/user_controller.dart';
import 'package:doctor/core/widgets/Custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/widgets/custom_app_bar.dart';

class MndobView extends StatefulWidget {
  const MndobView({super.key});
  @override
  State<MndobView> createState() => _BookingsViewState();
}
class _BookingsViewState extends State<MndobView> {
final GlobalKey<FormState> formKey2 = GlobalKey<FormState>(); // Unique Key

  MndobController controller =Get.put(MndobController());
  @override
  void initState() {
    controller.getData();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar('المندوبين', context, true),
      body:GetBuilder<MndobController>(
        builder: (_) {
          return  GridView.builder(   
            shrinkWrap: true,  
                  itemCount: controller.data.length,
                  itemBuilder: (context, index) {         
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: bookingCardWidget
                      (data: controller.data[index],)
                    );
                }, gridDelegate: const 
                SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 1,childAspectRatio:1.4
                )
              );
        }
      ),
    );
  }
}


class bookingCardWidget extends StatelessWidget {

  Map<String,dynamic>data;

  bookingCardWidget({super.key, required this.data});
  @override
  Widget build(BuildContext context) {

    MndobController controller =Get.put(MndobController());
 
    return Directionality(
      textDirection: TextDirection.rtl,
      child: InkWell(
        child: Container(
          decoration:BoxDecoration(
            borderRadius:BorderRadius.circular(13),
            color:Colors.grey[100]
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              const SizedBox(height: 10),
              Text("اسم المندوب : " +data['name'],style: TextStyle(
                color:Colors.black,fontSize: 18
              ),),
                const SizedBox(height: 10),
              Text("بريد المندوب : "+data['email'],style: TextStyle(
                color:Colors.black,fontSize: 18
              ),),
                const SizedBox(height: 10),
              Text("رقم الهاتف المندوب : "+data['phone'],style: TextStyle(
                color:Colors.black,fontSize: 18
              ),),
               Text("اسم الشركة : "+data['company_name'],style: TextStyle(
                color:Colors.black,fontSize: 18
              ),),
                const SizedBox(height: 10),
              Text("عنوان الشركة : "+data['company_address'],style: TextStyle(
                color:Colors.black,fontSize: 18
              ),),

              SizedBox(height: 12,),

              const SizedBox(height: 10),

              CustomButton(text: 'حذف المندوب', onPressed: (){

                controller.deleteMndob(int.parse(data['id']));

              }),
              const SizedBox(height: 10),
            ],),
          ),
        ),
        onTap:(){

        },
      ),
    );
  }
  
}
class UserCardWidget extends StatelessWidget {
  BookingController controller;
  Map<String,dynamic>user;

  UserCardWidget({super.key, required this.controller,required this.user});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(
      builder: (_) {
        return Container(
          decoration:BoxDecoration(
            borderRadius:BorderRadius.circular(13),
            color:Colors.grey[100]
          ),
          child:Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              const SizedBox(height: 10),
              Text("xxx"),
            //  Image.asset('assets/images/user2.png',height: 100,),
              // const SizedBox(height: 10),
              // Text(user['name']+"xxx",style: TextStyle(
              //   color:Colors.black,fontSize: 18
              // ),),
              //   const SizedBox(height: 10),
              // Text(user['email'],style: TextStyle(
              //   color:Colors.black,fontSize: 18
              // ),),
              //   const SizedBox(height: 10),
              // Text(user['phone'],style: TextStyle(
              //   color:Colors.black,fontSize: 18
              // ),),
            ],),
          ),
        );
      }
    );
  }
}