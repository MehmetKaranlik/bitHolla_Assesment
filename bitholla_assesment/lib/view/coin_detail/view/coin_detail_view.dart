import 'package:bitholla_assesment/core/base/view/base_view.dart';
import 'package:bitholla_assesment/core/constants/assets/svg_constants.dart';
import 'package:bitholla_assesment/core/extension/context_extension.dart';
import 'package:bitholla_assesment/core/widget/sizedBox/dynamic_horizontol_space.dart';
import 'package:bitholla_assesment/core/widget/sizedBox/dynamic_veritical_space.dart';
import 'package:bitholla_assesment/product/widget/groups/chart_sorter/widget/chart_sort_button_group.dart';
import 'package:bitholla_assesment/product/widget/groups/coin_detail_tab/widget/coin_detail_tab.dart';
import 'package:bitholla_assesment/view/coin_detail/controller/coin_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
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

  SizedBox _buildBody(BuildContext context) {
    return SizedBox(
      width: 100.w,
      child: Column(
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
          CoinDetailTabGroup()
        ],
      ),
    );
  }

  Text _buildDateTimeNow(BuildContext context) {
    return Text(
      "14:33, 26 Jun 2018",
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
      child: ChartSortButtonGroup(),
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
      leading: _buildAppBarLeadingIcon(context),
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
