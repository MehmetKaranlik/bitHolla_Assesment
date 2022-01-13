import 'package:bitholla_assesment/core/base/view/base_view.dart';
import 'package:bitholla_assesment/core/extension/context_extension.dart';
import 'package:bitholla_assesment/view/base/controller/home_controller.dart';
import 'package:bitholla_assesment/view/coin_detail/view/coin_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:sizer/sizer.dart';

class HomeView extends BaseView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => showSelectedBody(controller.selectedBody)),
      bottomNavigationBar: _bottomAppBar(context, controller),
    );
  }
}

Widget showSelectedBody(int index) {
  switch (index) {
    case 0:
      return const CoinDetailView();
    case 1:
      return Container();
    case 2:
      return Container();
    case 3:
      return Container();
    case 4:
      return Container();
    default:
      throw Container();
  }
}

BottomAppBar _bottomAppBar(BuildContext context, HomeController controller) {
  return BottomAppBar(
    child: Container(
      padding: EdgeInsets.only(top: 1.w),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: context.theme.colorScheme.onPrimary, width: 0.w),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Obx(() => IconButton(
              onPressed: () {
                controller.selectedBody = 0;
              },
              alignment: Alignment.center,
              padding: EdgeInsets.zero,
              iconSize: 25.sp,
              icon: Icon(
                Icons.ac_unit,
                color: defineColor(controller, 0, context),
              ))),
          Obx(() => IconButton(
              onPressed: () {
                controller.selectedBody = 1;
              },
              padding: EdgeInsets.zero,
              alignment: Alignment.center,
              iconSize: 25.sp,
              icon: Icon(
                Icons.ac_unit,
                color: defineColor(controller, 1, context),
              ))),
          Obx(() => IconButton(
              onPressed: () {
                controller.selectedBody = 2;
              },
              padding: EdgeInsets.zero,
              alignment: Alignment.center,
              iconSize: 25.sp,
              icon: Icon(
                Icons.ac_unit,
                color: defineColor(controller, 2, context),
              ))),
          Obx(() => IconButton(
              onPressed: () {
                controller.selectedBody = 3;
              },
              padding: EdgeInsets.zero,
              alignment: Alignment.center,
              iconSize: 25.sp,
              icon: Icon(Icons.ac_unit, color: defineColor(controller, 3, context)))),
          Obx(() => IconButton(
              onPressed: () {
                controller.selectedBody = 4;
              },
              padding: EdgeInsets.zero,
              alignment: Alignment.center,
              iconSize: 25.sp,
              icon: Icon(Icons.ac_unit, color: defineColor(controller, 4, context)))),
        ],
      ),
    ),
  );
}

Color defineColor(HomeController controller, int embeddedValue, BuildContext context) {
  return controller.selectedBody == embeddedValue
      ? context.theme.colorScheme.primary
      : context.theme.colorScheme.onPrimary;
}
