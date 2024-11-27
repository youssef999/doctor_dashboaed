

import 'package:doctor/admin/NUMBS/num_view.dart';
import 'package:doctor/admin/comp/comp_view.dart';
import 'package:doctor/admin/controller/admin_controller.dart';
import 'package:doctor/admin/views/doctors_view.dart';
import 'package:doctor/admin/views/mndob_view.dart';
import 'package:doctor/admin/views/users_view.dart';
import 'package:doctor/features/st/top_doc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/widgets/custom_app_bar.dart';
import '../../features/st/st_view.dart';
import 'bookings_view.dart';

class AdminView extends StatefulWidget {
  const AdminView({super.key});

  @override
  State<AdminView> createState() => _AdminViewState();
}

class _AdminViewState extends State<AdminView> {



 AdminController controller =Get.put(AdminController());
  final GlobalKey<FormState> formKey1 = GlobalKey<FormState>(); // Unique Key
  @override
  void initState() {
  // controller.getData();
   //controller.fetchData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: formKey1,
      appBar:CustomAppBar('DashBoard', context,false),
      body:Padding(
        padding: const EdgeInsets.all(22.0),
        child: ListView(children: [
        
          const SizedBox(height: 21),
          Image.asset('assets/images/logo.png',height: 200,

          ),
          const SizedBox(height: 21),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            InkWell(
              child: SizedBox(
                width: 311,
                child: Card(
                  color:Colors.green,
                  child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:Center(
                    child: Text("المستخدمين",style:TextStyle(
                      color:Colors.white,fontSize: 18
                    ),),
                  ),
                ),),
              ),
              onTap: () {
                Get.to(UsersView());
              },
            ),
        
             InkWell(
               child: SizedBox(
                 width: 311,
                 child: Card(
                    color:Colors.green,
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:Center(
                    child: Text("الأطباء",style:TextStyle(
                      color:Colors.white,fontSize: 18
                    ),),
                  ),
                           ),),
               ),
                         onTap:(){
                          Get.to(doctorsView());
                         },
             )
          ],),

           SizedBox(height: 21,),

        
           Row(
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children: [
            InkWell(
              child: SizedBox(
                width: 311,
                child: Card(
                  color:Colors.green,
                  child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:Center(
                    child: Text("الحجوزات",style:TextStyle(
                      color:Colors.white,fontSize: 18
                    ),),
                  ),
                ),),
              ),
              onTap: () {
                Get.to( BookingsView());
              //  Get.to(UsersView());
              },
            ),

              InkWell(
                child: SizedBox(
                  width: 311,
                  child: Card(
                    color:Colors.green,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:Center(
                        child: Text("الاحصاءات ",style:TextStyle(
                            color:Colors.white,fontSize: 18
                        ),),
                      ),
                    ),),
                ),
                onTap: () {

                  Get.to(StView());


                  //  Get.to(UsersView());
                },
              ),

          ],),
          SizedBox(height: 21,),
          Row(
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                child: SizedBox(
                  width: 311,
                  child: Card(
                    color:Colors.green,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:Center(
                        child: Text("الاطباء الاعلي تقييما ",style:TextStyle(
                            color:Colors.white,fontSize: 18
                        ),),
                      ),
                    ),),
                ),
                onTap: () {
                  Get.to( TopDocView());
                  //  Get.to(UsersView());
                },
              ),

              InkWell(
                child: SizedBox(
                  width: 311,
                  child: Card(
                    color:Colors.green,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:Center(
                        child: Text("عرض الشكاوي ",style:TextStyle(
                            color:Colors.white,fontSize: 18
                        ),),
                      ),
                    ),),
                ),
                onTap: () {
                  Get.to( CompView());
                  //  Get.to(UsersView());
                },
              ),




            ],),

          SizedBox(height: 21,),
          Row(
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                child: SizedBox(
                  width: 311,
                  child: Card(
                    color:Colors.green,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:Center(
                        child: Text(" عدد المستخدمين و الاطباء ",style:TextStyle(
                            color:Colors.white,fontSize: 18
                        ),),
                      ),
                    ),),
                ),
                onTap: () {
                  Get.to( NumView());
                  //  Get.to(UsersView());
                },
              ),

              InkWell(
                child: SizedBox(
                  width: 311,
                  child: Card(
                    color:Colors.green,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:Center(
                        child: Text("عرض الشكاوي ",style:TextStyle(
                            color:Colors.white,fontSize: 18
                        ),),
                      ),
                    ),),
                ),
                onTap: () {
                  Get.to( CompView());
                  //  Get.to(UsersView());
                },
              ),




            ],),

          //NumView
          
        ],),
      ),
    );
  }
}