// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../resources/app_colors.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  Color color1;
  double? size;
  Color color2;

  CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.size,
    this.color1 = Colors.green,
    this.color2 = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        // width:120,
        height: 50,
        child: InkWell(
            child: Container(
              decoration: BoxDecoration(
                color: color1,
                borderRadius: const BorderRadius.all(Radius.circular(22)),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.lightColor.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    text,

                    maxLines: 1,
                    style: GoogleFonts.cairo(
                        color: Colors.white, fontSize:size?? 17),
                  ),
                ),
              ),
            ),
            onTap: () {
              onPressed();
            })

        // RaisedButton(
        //
        //   elevation: 10,
        //   onPressed: onPressed(),
        //   color: color1,
        //   // shape: RoundedRectangleBorder(
        //   //     borderRadius: BorderRadius.circular(30)),
        //   child: Padding(
        //     padding: EdgeInsets.all(10),
        //     child: Text(
        //       text,
        //       style: getRegularStyle(color: color2,fontSize:20)
        //     ),
        //   ),
        // ),
        );
  }
}
