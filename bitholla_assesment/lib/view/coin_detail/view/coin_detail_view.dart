import 'dart:convert';

import 'package:bitholla_assesment/core/base/view/base_view.dart';
import 'package:bitholla_assesment/core/constants/assets/svg_constants.dart';
import 'package:bitholla_assesment/core/widget/sizedBox/dynamic_horizontol_space.dart';
import 'package:bitholla_assesment/core/widget/sizedBox/dynamic_veritical_space.dart';
import 'package:bitholla_assesment/product/widget/groups/chart_sorter/widget/chart_sort_button_group.dart';
import 'package:bitholla_assesment/product/widget/groups/coin_detail_tab/widget/coin_detail_tab.dart';
import 'package:bitholla_assesment/product/widget/groups/double_sided_list_view/widget/double_sided_list_view.dart';
import 'package:bitholla_assesment/view/coin_detail/controller/coin_detail_controller.dart';
import 'package:bitholla_assesment/view/coin_detail/model/coin_ask_and_bid_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CoinDetailView extends BaseView<CoinDetailViewController> {
  const CoinDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Obx(() => controller.isLoading ? _buildProgressIndicator(context) : _buildBody(context)),
    );
  }

  Center _buildProgressIndicator(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: context.theme.colorScheme.primary,
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        DynamicVerticalSpace(),
        _buildWalletAmount(context),
        DynamicVerticalSpace(
          height: 1.h,
        ),
        _buildDateTimeNow(context),
        _buildUpperStack(context),
        DynamicVerticalSpace(),
        const CoinDetailTabGroup(),
        DynamicVerticalSpace(),
        _buildTags(context),
        _buildSeperator(context),
        _buildBuyerAndSellerStream()
      ],
    );
  }

  Expanded _buildBuyerAndSellerStream() {
    return Expanded(
      child: Obx(() => StreamBuilder(
            stream: controller.channel.stream,
            builder: (context, AsyncSnapshot? snapshot) {
              if (snapshot!.hasData && !snapshot.data.toString().contains('message')) {
                print(snapshot.data);
                var response = CoinAskAndBidModel.fromJson(jsonDecode(snapshot.data));
                return _buildDoubleSidedListView(response);
              }
              return _buildPlaceHolder(context);
            },
          )),
    );
  }

  DoubleSidedListView _buildDoubleSidedListView(CoinAskAndBidModel response) {
    return DoubleSidedListView(
      leftList: response.data!.asks!,
      rightList: response.data!.bids!,
    );
  }

  Container _buildPlaceHolder(BuildContext context) {
    return Container(
      height: 30.h,
      alignment: Alignment.center,
      width: context.width,
      child: Shimmer.fromColors(
          baseColor: context.theme.colorScheme.onPrimary,
          highlightColor: context.theme.colorScheme.primary,
          child: Text(
            "Loading...",
            style: context.textTheme.headline1!.copyWith(fontSize: 30.sp),
          )),
    );
  }

  Row _buildTags(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        DynamicHorizontalSpace(
          width: 2.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Amount",
              style: context.textTheme.bodyText1!.copyWith(color: context.theme.colorScheme.secondary, fontSize: 10.sp),
            ),
            Text(
              "(XHT)",
              style: context.textTheme.bodyText1!.copyWith(color: context.theme.colorScheme.secondary, fontSize: 10.sp),
            )
          ],
        ),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Price",
              style: context.textTheme.bodyText1!.copyWith(color: context.theme.colorScheme.secondary, fontSize: 10.sp),
            ),
            Text(
              "(USDT)",
              style: context.textTheme.bodyText1!.copyWith(color: context.theme.colorScheme.secondary, fontSize: 10.sp),
            )
          ],
        ),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Amount",
              style: context.textTheme.bodyText1!.copyWith(color: context.theme.colorScheme.secondary, fontSize: 10.sp),
            ),
            Text(
              "(XHT)",
              style: context.textTheme.bodyText1!.copyWith(color: context.theme.colorScheme.secondary, fontSize: 10.sp),
            )
          ],
        ),
        DynamicHorizontalSpace(
          width: 2.w,
        )
      ],
    );
  }

  Row _buildSeperator(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildLeftSideText(context),
        _buildLeftSideDivider(context),
        DynamicHorizontalSpace(
          width: 3.w,
        ),
        _buildRightSideDivider(context),
        DynamicHorizontalSpace(
          width: 3.w,
        ),
        _buildRightSideText(context)
      ],
    );
  }

  Text _buildRightSideText(BuildContext context) {
    return Text(
      "Seller",
      style: context.textTheme.bodyText1,
    );
  }

  SizedBox _buildRightSideDivider(BuildContext context) {
    return SizedBox(
      width: 30.w,
      child: Divider(
        indent: 5.w,
        color: context.theme.colorScheme.primary,
        thickness: 0.4.w,
      ),
    );
  }

  SizedBox _buildLeftSideDivider(BuildContext context) {
    return SizedBox(
      width: 30.w,
      child: Divider(
        indent: 5.w,
        color: context.theme.colorScheme.error,
        thickness: 0.4.w,
      ),
    );
  }

  Text _buildLeftSideText(BuildContext context) {
    return Text(
      "Buyer",
      style: context.textTheme.bodyText1!.copyWith(color: context.theme.colorScheme.error),
    );
  }

  Text _buildDateTimeNow(BuildContext context) {
    return Text(
      "12", //DateFormat.yMd().add_jm().format(DateTime.now()),
      style: context.textTheme.subtitle2!.copyWith(color: context.theme.colorScheme.onPrimary),
    );
  }

  Text _buildWalletAmount(BuildContext context) {
    return Text(
      "\$" "${controller.chartData.last.high}",
      style: context.textTheme.headline3!.copyWith(
        color: context.theme.colorScheme.secondary,
      ),
    );
  }

  Obx _buildUpperStack(BuildContext context) {
    return Obx(() => Stack(
          fit: StackFit.passthrough,
          children: [
            _buildChart(context),
            _buildChartSortButton(),
          ],
        ));
  }

  Positioned _buildChartSortButton() {
    return Positioned(
      top: 17.h,
      left: 5.w,
      child: const ChartSortButtonGroup(),
    );
  }

  SizedBox _buildChart(BuildContext context) {
    return SizedBox(
      height: 20.h,
      child: SfCartesianChart(
        margin: const EdgeInsets.all(0),
        plotAreaBorderWidth: 0,
        primaryXAxis: _buildXAxisSettings(),
        primaryYAxis: _buildYAxisSettings(),
        series: controller.getDefaultLineSeries(context),
      ),
    );
  }

  NumericAxis _buildYAxisSettings() {
    return NumericAxis(
      isVisible: false,
      majorGridLines: const MajorGridLines(width: 0),
      majorTickLines: const MajorTickLines(color: Colors.transparent),
      axisLine: const AxisLine(width: 0),
    );
  }

  DateTimeAxis _buildXAxisSettings() {
    return DateTimeAxis(
      isVisible: false,
      intervalType: DateTimeIntervalType.days,
      desiredIntervals: 10,
      axisLine: const AxisLine(width: 0),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: _buildAppBarTitle(context),
      actions: _buildAppBarActions(context),
    );
  }

  List<Widget> _buildAppBarActions(BuildContext context) {
    return [
      Icon(
        Icons.add_alert_rounded,
        color: context.theme.colorScheme.onPrimary,
        size: 8.w,
      ),
      DynamicHorizontalSpace()
    ];
  }

  Row _buildAppBarTitle(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          SvgConstants.instance.bitcoinIcon,
          height: 6.3.w,
        ),
        DynamicHorizontalSpace(),
        Text(
          "XHT / USDT",
          style: context.textTheme.headline3!.copyWith(
            color: context.theme.colorScheme.secondary,
          ),
        )
      ],
    );
  }

  Icon _buildAppBarLeadingIcon(BuildContext context) {
    return Icon(
      Icons.arrow_back_rounded,
      color: context.theme.colorScheme.primary,
    );
  }
}
