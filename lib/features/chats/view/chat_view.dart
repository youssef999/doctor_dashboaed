import 'dart:io';

import 'package:doctor/core/resources/app_colors.dart';
import 'package:doctor/core/widgets/basicAppBar.dart';
import 'package:doctor/features/chats/controller/chats_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatView extends GetView<ChatsController> {
  const ChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: BasicAppBar('دكتور علي الياسري'),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: controller.messages.length,
                itemBuilder: (context, index) {
                  final message = controller.messages[index];
                  return ChatMessageWidget(
                    message: message,
                    isSender: true,
                  );
                },
              ),
            ),
          ),
          ChatInputField(controller: controller),
        ],
      ),
    );
  }
}

class ChatMessageWidget extends StatelessWidget {
  final ChatMessage message;
  bool isSender;
  ChatMessageWidget({required this.message, required this.isSender});

  @override
  Widget build(BuildContext context) {
    if (message.type == MessageType.text) {
      return Align(
        alignment: isSender == true ? Alignment.topRight : Alignment.topLeft,
        child: Container(
          margin:  EdgeInsets.only(
                  right: 20,
                  top: 10,
                  left: 20
                )
               ,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: isSender == true
                ? const Color.fromRGBO(0, 111, 253, 1)
                : const Color.fromRGBO(248, 249, 254, 1),
            borderRadius: isSender == true
                ? const BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12))
                : const BorderRadius.only(
                    bottomRight: Radius.circular(12),
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12)),
          ),
          child: Column(
           crossAxisAlignment: isSender == true ? CrossAxisAlignment.start:CrossAxisAlignment.end ,
           
            children: [
              Text(
                'دكتور علي الياسري',
                style: GoogleFonts.cairo(
                  fontSize: 8,
                    color: isSender == true ? Colors.white : AppColors.greyColor.withOpacity(.5)),
              ),
              SizedBox(height: 4,),
              Text(
                message.text!,
                style: GoogleFonts.cairo(
                  fontSize: 12,
                    color: isSender == true ? Colors.white : AppColors.darkColor),
              ),
            ],
          ),
        ),
      );
    } else if (message.type == MessageType.image) {
      return ListTile(
        title: Align(
          alignment:isSender == true ? Alignment.topRight: Alignment.topLeft,
          child: Container(
        constraints: BoxConstraints.loose(Size(200, 200)),
            clipBehavior: Clip.antiAlias,
           // padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.greyColor.withOpacity(.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.file(File(message.imagePath!),fit: BoxFit.cover,),
          ),
        ),
      );
    } else if (message.type == MessageType.audio) {
      return ListTile(
        title: Align(
          alignment:isSender == true ? Alignment.topRight: Alignment.topLeft,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Row(
              children: [
                Icon(Icons.play_arrow),
                Expanded(child: Text('Audio message')),
              ],
            ),
          ),
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}

class ChatInputField extends StatelessWidget {
  final ChatsController controller;
  final TextEditingController textController = TextEditingController();
  Rx<bool>? isSent = true.obs;
  RxString msg = ''.obs;
  ChatInputField({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Obx(() {
        return Row(
          children: [
            isSent?.value == false
                ? GestureDetector(
                    onTap: () {
                      controller.sendTextMessage(msg.value);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                          color: AppColors.primaryBGLightColor.withOpacity(.4),
                          borderRadius: BorderRadius.circular(50)),
                      child: SvgPicture.asset(
                        'assets/icon/send.svg',
                        width: 14,
                      ),
                    ),
                  )
                : GestureDetector(
                    onTap: () {
                      controller.startRecording;
                    },
                    child: Container(
                      padding: const EdgeInsets.only(
                          top: 10, bottom: 10, left: 13, right: 13),
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                          color: AppColors.primaryBGLightColor.withOpacity(.4),
                          borderRadius: BorderRadius.circular(100)),
                      child: SvgPicture.asset(
                        'assets/icon/record.svg',
                        width: 12,
                      ),
                    ),
                  ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 40,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      width: 0, color: AppColors.greyColor.withOpacity(.1)),
                  color: AppColors.greyColor.withOpacity(.08),
                ),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 190,
                      child: TextFormField(
                        
                        controller: textController,
                        onChanged: (value) {
                          isSent?.value = false;
                          msg.value = value;
                        },
                      //  maxLines: 2,
                        decoration: InputDecoration(
                          hintText: 'مراسلهّ',
                          contentPadding: EdgeInsets.only(right: 20),
                          hintStyle: GoogleFonts.cairo(
                              fontSize: 12,
                              color: AppColors.greyColor.withOpacity(.3)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                  width: 0,
                                  color: AppColors.greyColor.withOpacity(.01))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                  width: 0,
                                  color: AppColors.greyColor.withOpacity(.01))),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                  width: 0,
                                  color: AppColors.greyColor.withOpacity(.01))),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.camera_alt_outlined,
                        size: 22,
                        color: AppColors.greyColor.withOpacity(.4),
                      ),
                      onPressed: controller.pickImage,
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.attachment_outlined,
                        size: 22,
                        color: AppColors.greyColor.withOpacity(.4),
                      ),
                      onPressed: controller.pickImage,
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
