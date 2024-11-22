import 'package:doctor/core/resources/app_colors.dart';
import 'package:doctor/core/widgets/bottom_navber.dart';
import 'package:doctor/features/root/controller/root_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RootView extends GetView<RootController> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  RootView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        key: scaffoldKey,
       // drawer: const CustomDrawer(),
       // extendBody: true,
        backgroundColor: AppColors.primaryLightColor,
        bottomNavigationBar:
            buildBottomNavigationMenu(context, controller,controller.users.value.roleId ?? '0'),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: 
        controller
            .page[controller.selectedIndex.value],
      ));
  
  }
}
