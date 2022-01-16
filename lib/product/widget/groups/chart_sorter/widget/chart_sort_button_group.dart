import 'package:bitholla_assesment/core/widget/sizedBox/dynamic_horizontol_space.dart';
import 'package:bitholla_assesment/product/widget/button/chart_sorter_button.dart';
import 'package:bitholla_assesment/product/widget/groups/chart_sorter/controller/chart_sort_button_group_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ChartSortButtonGroup extends StatefulWidget {
  const ChartSortButtonGroup({
    Key? key,
  }) : super(key: key);

  @override
  State<ChartSortButtonGroup> createState() => _ChartSortButtonGroupState();
}

class _ChartSortButtonGroupState extends State<ChartSortButtonGroup> {
  late final ChartSortButtonGroupController _controller;

  @override
  void initState() {
    _controller = Get.put(ChartSortButtonGroupController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 3.h,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Obx(() => ChartSorterButton(
                      onTap: () => _controller.selectedSortButtonIndex = index,
                      isSelected: _controller.selectedSortButtonIndex == index,
                      buttonText: _controller.chartTitleList[index],
                    ));
        },
        separatorBuilder: (context, index) => DynamicHorizontalSpace(
          width: 0,
        ),
        itemCount: _controller.chartTitleList.length,
      ),
    );
  }
}
