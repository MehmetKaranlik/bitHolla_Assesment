import 'package:bitholla_assesment/core/extension/context_extension.dart';
import 'package:bitholla_assesment/core/widget/sizedBox/dynamic_horizontol_space.dart';
import 'package:bitholla_assesment/core/widget/sizedBox/dynamic_veritical_space.dart';
import 'package:bitholla_assesment/product/widget/groups/double_sided_list_view/controller/double_sided_list_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:sizer/sizer.dart';

class DoubleSidedListView extends StatefulWidget {
  const DoubleSidedListView({
    Key? key,
  }) : super(key: key);

  @override
  State<DoubleSidedListView> createState() => _DoubleSidedListViewState();
}

class _DoubleSidedListViewState extends State<DoubleSidedListView> {
  late final DoubleSidedListViewController _controller;

  @override
  void initState() {
    _controller = Get.put(DoubleSidedListViewController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 2.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildLeftListView(),
          VerticalDivider(
            thickness: 0.2.w,
          ),
          _buildRightListView(),
        ],
      ),
    );
  }

  SizedBox _buildRightListView() {
    return SizedBox(
      width: 48.w,
      child: ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => _controller.rightSelectedIndex = index,
          child: Obx(() => _buildRightSideListTile(index, context)),
        ),
        separatorBuilder: (context, index) => DynamicVerticalSpace(height: 1.h),
        itemCount: 10,
      ),
    );
  }

  Container _buildRightSideListTile(int index, BuildContext context) {
    return Container(
      color: _controller.rightSelectedIndex == index ? context.theme.colorScheme.primary : Colors.transparent,
      height: 3.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildRightSidePrice(context, index),
          DynamicHorizontalSpace(
            width: 4.w,
          ),
          _buildRightSideAmount(context, index),
          DynamicHorizontalSpace(
            width: 4.w,
          ),
          _buildRightSideTotalAmount(context)
        ],
      ),
    );
  }

  Container _buildRightSideTotalAmount(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Text(
        "0.2269",
        style: context.textTheme.bodyText2!.copyWith(fontSize: 10.sp, color: context.theme.colorScheme.background),
      ),
    );
  }

  Text _buildRightSideAmount(BuildContext context, int index) {
    return Text(
      "0.2269",
      style: context.textTheme.bodyText2!.copyWith(
          fontSize: 10.sp,
          color: _controller.rightSelectedIndex == index
              ? context.theme.colorScheme.background
              : context.theme.colorScheme.primary),
    );
  }

  Text _buildRightSidePrice(BuildContext context, int index) {
    return Text(
      "0.2269",
      style: context.textTheme.bodyText2!.copyWith(
          fontSize: 10.sp,
          color: _controller.rightSelectedIndex == index
              ? context.theme.colorScheme.background
              : context.theme.colorScheme.primary),
    );
  }

  SizedBox _buildLeftListView() {
    return SizedBox(
      width: 48.w,
      child: ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => _controller.leftSelectedIndex = index,
          child: Obx(() => _buildLeftSideListTile(index, context)),
        ),
        separatorBuilder: (context, index) => DynamicVerticalSpace(height: 1.h),
        itemCount: 10,
      ),
    );
  }

  Container _buildLeftSideListTile(int index, BuildContext context) {
    return Container(
      color: _controller.leftSelectedIndex == index ? context.theme.colorScheme.error : Colors.transparent,
      height: 3.h,
      width: 48.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildLeftSideTotalAmount(context),
          DynamicHorizontalSpace(
            width: 4.w,
          ),
          _buildLeftSideAmount(context, index),
          DynamicHorizontalSpace(
            width: 4.w,
          ),
          _buildLeftSidePrice(context, index),
        ],
      ),
    );
  }

  Text _buildLeftSidePrice(BuildContext context, int index) {
    return Text(
      "0.2269",
      style: context.textTheme.bodyText2!.copyWith(
          fontSize: 10.sp,
          color: _controller.leftSelectedIndex == index
              ? context.theme.colorScheme.background
              : context.theme.colorScheme.error),
    );
  }

  Text _buildLeftSideAmount(BuildContext context, int index) {
    return Text(
      "0.2269",
      style: context.textTheme.bodyText2!.copyWith(
          fontSize: 10.sp,
          color: _controller.leftSelectedIndex == index
              ? context.theme.colorScheme.background
              : context.theme.colorScheme.error),
    );
  }

  Container _buildLeftSideTotalAmount(BuildContext context) {
    return Container(
      color: context.theme.colorScheme.error,
      child: Text(
        "0.2269",
        style: context.textTheme.bodyText2!.copyWith(fontSize: 10.sp, color: context.theme.colorScheme.background),
      ),
    );
  }
}
