

import 'package:doctor/admin/controller/doc_controller.dart';
import 'package:doctor/admin/views/doc_profile.dart';
import 'package:doctor/core/resources/app_colors.dart';
import 'package:doctor/core/widgets/Custom_button.dart';
import 'package:doctor/core/widgets/custom_app_bar.dart';
import 'package:doctor/features/user/doctorUser/controller/doctor_controller.dart';
import 'package:doctor/models/doctor_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class doctorsView extends StatefulWidget {
  const doctorsView({super.key});
  @override
  State<doctorsView> createState() => _UsersViewState();
}
class _UsersViewState extends State<doctorsView> {
final GlobalKey<FormState> formKey2 = GlobalKey<FormState>(); // Unique Key

 DocController controller =Get.put(DocController());

  @override
  void initState() {
  controller.getDoctors();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar('الاطباء'.tr, context, true),
      backgroundColor:Colors.grey[200],
      body:Directionality(
        textDirection:TextDirection.rtl,
        child: GetBuilder<DocController>(
          builder: (_) {
            return  GridView.builder(
              shrinkWrap: true,
                    itemCount: controller.doctorData.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: buildDoctorCard(
                          data: controller.doctorData[index],
                        ));
                  }, gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 1,childAspectRatio:2.3
                  )
                );
          }
        ),
      ),
    );
  }
}



 Widget buildDoctorCard({
   required Map<String,dynamic>data
  }) {


  Doctor doctor = Doctor.fromJson(data);
  DoctorController controller=Get.put(DoctorController());
  DocController docController=Get.put(DocController());
  controller.doctor.value = doctor;

    return InkWell(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color:Colors.white,
                border: Border(
              top: BorderSide(width: .5, color: AppColors.greyColor.withOpacity(0.1)),
              bottom:
                  BorderSide(width: .5, color: AppColors.greyColor.withOpacity(0.1)),
            )),
            //height: 170,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        data['image']
                      ),
                      radius: 40,
                    ),

                  ],
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                     "اسم الطبيب : "+ data['name'],
                      style: GoogleFonts.cairo(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ), Text(
                    "رقم الهاتف : "+  data['phone'],
                      style: GoogleFonts.cairo(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ), Text(
                    "القسم : "+  data['cat'],
                      style: GoogleFonts.cairo(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),


                    // Row(
                    //   children: [
                    //     const Icon(Icons.star, color: Colors.yellow, size: 14),
                    //     Text(
                    //       data['rate'].toString(),
                    //       style: GoogleFonts.cairo(
                    //         fontWeight: FontWeight.w500,
                    //         fontSize: 12,
                    //         color: Colors.black,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    Text(
                      'سعر الكشف ${data['price']} دينار',
                      style: GoogleFonts.cairo(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),

                    const SizedBox(height: 10),

                    CustomButton(text: 'حذف الطبيب', onPressed: (){
                      docController.deleteDoctor(int.parse(data['id']));
                      //  Get.back();
                    }),
                    const SizedBox(height: 10),
                    // Text(
                    //   data['location'],
                    //   style: GoogleFonts.cairo(
                    //     fontWeight: FontWeight.w400,
                    //     fontSize: 12,
                    //     color: Colors.grey,
                    //   ),
                    // ),
                  ],
                ),

              ],
            ),
          ),


        ],
      ),
      onTap:(){
        Get.to(
            DoctorAdminProfileView(data: data),
          // Routes.DOCTOR,
          // arguments: {'doctor': doctor},
        );
      },
    );
  }

class UserCardWidget extends StatelessWidget {
  DocController controller;
  Map<String,dynamic>user;
  UserCardWidget({super.key, required this.controller,required this.user});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DocController>(
      builder: (_) {
        return Container(
          decoration:BoxDecoration(
            borderRadius:BorderRadius.circular(13),
            color:Colors.grey[100]
          ),
          child:Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              child: Column(children: [
                const SizedBox(height: 10),
                Image.network(user['image'],height: 100,),
                const SizedBox(height: 10),
                Text(user['name'],style: GoogleFonts.cairo(
                  color:Colors.black,fontSize: 18
                ),),
                  const SizedBox(height: 10),
                Text(user['email'],style: GoogleFonts.cairo(
                  color:Colors.black,fontSize: 18
                ),),
                  const SizedBox(height: 10),
                Text(user['phone'],style: GoogleFonts.cairo(
                  color:Colors.black,fontSize: 18
                ),),
              ],),
              onTap:(){

              },
            ),
          ),
        );
      }
    );
  }
}