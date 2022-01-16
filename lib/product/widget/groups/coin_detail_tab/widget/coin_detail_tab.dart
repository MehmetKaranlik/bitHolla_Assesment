import 'package:bitholla_assesment/product/widget/button/coin_details_tab_button.dart';
import 'package:bitholla_assesment/product/widget/groups/coin_detail_tab/controller/coin_detail_tab_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoinDetailTabGroup extends StatefulWidget {
  const CoinDetailTabGroup({Key? key}) : super(key: key);

  @override
  State<CoinDetailTabGroup> createState() => _CoinDetailTabGroupState();
}

class _CoinDetailTabGroupState extends State<CoinDetailTabGroup> {
  late final CoinDetailTabGroupController _controller;
  @override
  void initState() {
    _controller = Get.put(CoinDetailTabGroupController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CoinDetailTabButton(
              buttonText: 'coinInfo'.tr,
              isSelected: true,
              onTap: () => _controller.selectedTabTag = 0,
              itemIndex: 0,
              tag: _controller.selectedTabTag,
            ),
            CoinDetailTabButton(
              buttonText: 'markets'.tr,
              isSelected: true,
              onTap: () => _controller.selectedTabTag = 1,
              itemIndex: 1,
              tag: _controller.selectedTabTag,
            ),
            CoinDetailTabButton(
              buttonText: 'holdings'.tr,
              isSelected: true,
              onTap: () => _controller.selectedTabTag = 2,
              itemIndex: 2,
              tag: _controller.selectedTabTag,
            ),
          ],
        ));
  }
}
