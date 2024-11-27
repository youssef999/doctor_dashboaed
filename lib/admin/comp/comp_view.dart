


 import 'package:doctor/admin/comp/comp_controller.dart';
import 'package:doctor/admin/comp/user_details.dart';
import 'package:doctor/core/widgets/Custom_button.dart';
import 'package:doctor/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
 import 'dart:typed_data';
class CompView extends StatefulWidget {
   const CompView({super.key});
 
   @override
   State<CompView> createState() => _CompViewState();
 }
 
 class _CompViewState extends State<CompView> {


  CompController controller=Get.put(CompController());
  @override
  void initState() {
    controller.getData();
    super.initState();
  }
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: CustomAppBar('الشكاوي', context, false),
       body:Padding(
         padding:  EdgeInsets.all(8.0),
         child: GetBuilder<CompController>(
           builder: (_) {
             return ListView(children: [
               SizedBox(height: 12,),
               GridView.builder(
                 shrinkWrap:true ,
                 itemCount: controller.data.length,
                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount
                 (crossAxisCount: 2  ,
                 childAspectRatio: 2.1,
                 mainAxisSpacing: 1),
                 itemBuilder: (BuildContext context, int index) {

                   return Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: CompCard(data: controller.data[index]),
                   );
                 }),
             ],);
           }
         ),
       ),
     );
   }
 }


 class CompCard extends StatelessWidget {

  Map<String,dynamic> data;

  CompCard({super.key,required this.data});

   @override
   Widget build(BuildContext context) {
     return Container(
       decoration:BoxDecoration(
         borderRadius:BorderRadius.circular(12),
         color: Colors.blue
       ),
       child:Column(children: [
         SizedBox(height: 12,),
         Text(data['title'],style:TextStyle(color:
         Colors.black),),
         SizedBox(height: 12,),

         (data['msg'].toString().contains('.jpeg')||
             data['msg'].toString().contains('.jpg')||
             data['msg'].toString().contains('imgur.com')||
             data['msg'].toString().contains('.png'))?
             //Image.network(data['msg'],height: 100,)
         Center(
           child: CircleAvatar(
               radius: 71,
               backgroundImage:
               NetworkImage(data['msg'])),
         )

             :Text(data['msg'],style:TextStyle(color:
         Colors.black),),
         SizedBox(height: 12,),

         Container(
           decoration:BoxDecoration(
             borderRadius:BorderRadius.circular(12),
             color:Colors.grey
           ),
           child:Padding(
             padding: const EdgeInsets.all(14.0),
             child: Column(children: [
               Text('اسم المستخدم : '+data['user_name'],style:TextStyle(color:Colors.white),),
             ],),
           ),
         ),

         SizedBox(height: 12,),

         SizedBox(
           width: 333,
           child: CustomButton(text: 'انتقل لحساب المستخدم', onPressed: (){

             Get.to(userDetailsView(id: data['user_id'],
             ));



           }),
         )


       ],),
     );
   }
 }
