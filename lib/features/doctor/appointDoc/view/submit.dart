import 'package:doctor/core/const/app_message.dart';
import 'package:doctor/core/resources/app_colors.dart';
import 'package:doctor/core/widgets/custom_app_bar.dart';
import 'package:doctor/core/widgets/custom_textformfield2.dart';
import 'package:doctor/features/doctor/appointDoc/controller/appointDoc_controller.dart';
import 'package:doctor/models/booking_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SubmitAppointmentView extends GetView<AppointmentDoctorController> {

  Booking booking;

 SubmitAppointmentView({super.key,required this.booking});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: CustomAppBar('تحديد موعد'.tr, context, false),
        body: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.start,
            // shrinkWrap: true,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20, bottom: 20, left: 10, right: 10),
                    child: Text(
                      'تحديد موعد مع المريض',
                      style:
                          GoogleFonts.cairo(fontWeight: FontWeight.w500),
                    ),
                  ),
                  CustomTextFormFieldV2(
                      hint: booking.date,
                      //'غدا ٨ مارس',
                      label: 'تاريخ الحجز',
                      controller:controller.dateController),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 130,
                        child: CustomTextFormFieldV2(
                            hint:booking.time,
                            // '10:00',
                            label: 'الساعه',
                            controller: controller.timeController),
                      ),
                      SizedBox(
                        width: 180,
                        child: CustomTextFormFieldV2(
                            type: TextInputType.number,
                            hint: 'ادخل رقم الانتظار',
                            label: 'رقم الانتظار',
                            controller:controller.numberController),
                      ),
                    ],
                  )
                ],
              ),

              Obx(() {
                return !controller.isSuccess.value
                    ? GestureDetector(
                        onTap: () {


                    print(controller.numberController.text);

                        //  controller.isSuccess.value = true;
                     

                     if(controller.numberController.text.isEmpty){

                      appMessage(text: 'قم بادخال رقم الانتظار ', fail: true);
                       
                     }
                     
                     else{

                      controller.changeBookingStatus(booking.id.toString(), 
                     'Done');


                     String time='';
                 

                     if(controller.timeController.text.length>1){
                      time=controller.timeController.text;
                     }else{
                      time=booking.bookingTimeHours.toString();
                     }


                     controller.SetAppointment(time, controller.numberController.text);

                     }
                     
                    

                        },
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 30),
                          padding: const EdgeInsets.only(top: 15, bottom: 15),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color(0xFF04CE00),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            'تاكيد',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.cairo(
                              fontWeight: FontWeight.w700,
                              fontSize: 17,
                              height: 1.3,
                              letterSpacing: -0.4,
                              color: const Color(0xFFFFFFFF),
                            ),
                          ),
                        ),
                      )
                    : SizedBox(
                      height: 450,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/images/success.gif',
                              scale: 4,
                            ),
                            Text(
                              'تم الحجز بنجاح',
                              style: GoogleFonts.cairo(
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 10,),
                            Text(
                              'بتاريخ  8مارس الساعة 2:30',
                              style: GoogleFonts.cairo(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: const Color.fromARGB(255, 173, 173, 173),
                              ),
                            ),
                              const SizedBox(height: 30,),
                            GestureDetector(
                              onTap: () {
                                //  Get.toNamed(Routes.ROOT);
                                // controller.userLogin();
                              },
                              child: Container(
                                width: 160,
                                height: 45,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF04CE00),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                  child: Text(
                                    'قائمه الحجوزات',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.cairo(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                      
                                      // height: 1.3,
                                      //  letterSpacing: -0.4,
                                      color: const Color(0xFFFFFFFF),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20,),
                            GestureDetector(
                              onTap: () {
                                //  Get.toNamed(Routes.ROOT);
                                // controller.userLogin();
                              },
                              child: Container(
                                width: 160,
                                height: 45,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1,
                                      color: AppColors.greyColor.withOpacity(.2)),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                  child: Text(
                                    'الحجوزات المعلقه',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.cairo(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      color: const Color.fromARGB(
                                          255, 173, 173, 173),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                    );
              }),
              // SizedBox(height: 10,)
            ],
          ),
        ));
  }
}
