// ignore_for_file: file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor/core/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


// ignore: must_be_immutable
class CustomButtonV extends StatelessWidget {
  final String text;
  final String img;
  final Function onPressed;
  Color color1;
  Color color2;

  CustomButtonV({
    super.key,
    required this.text,
    required this.onPressed,
    required this.img,
    this.color1 = const Color(0xFF0080ff),
    this.color2 = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(22)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: AppColors.lightColor.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                child: CachedNetworkImage(
                  imageUrl: img,
                  fit: BoxFit.fill,
                  errorWidget: (context, url, error) => Image.asset(img,fit: BoxFit.cover,),
                ),
              ),
              Container(
                color:
                    const Color.fromARGB(255, 37, 65, 34).withOpacity(.5),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    text,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.cairo(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          onPressed();
        });
  }
}
