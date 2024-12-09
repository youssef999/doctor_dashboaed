import 'package:doctor/admin/comp/comp_controller.dart';
import 'package:doctor/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class NumView extends StatefulWidget {
  const NumView({super.key});

  @override
  State<NumView> createState() => _NumViewState();
}

class _NumViewState extends State<NumView> {
  CompController controller = Get.put(CompController());

  @override
  void initState() {
    controller.getNumData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar('DASHBOARD', context, false),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<CompController>(builder: (_) {
          return ListView(
            children: [
              SizedBox(
                height: 12,
              ),
              (controller.numData.length == 0)
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CardWidget(
                            txt: 'عدد المستخدمين',
                            num: controller.numData['user_count'].toString()),
                        SizedBox(
                          width: 33,
                        ),
                        CardWidget(
                            txt: 'عدد الاطباء',
                            num: controller.numData['doctor_count'].toString()),
                      ],
                    )
            ],
          );
        }),
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  String txt;
  String num;

  CardWidget({super.key, required this.txt, required this.num});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(13),
          color: Colors.grey[100]),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              txt,
              style: GoogleFonts.cairo(color: Colors.black, fontSize: 18),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              num,
              style: GoogleFonts.cairo(color: Colors.black, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
