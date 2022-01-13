import 'package:bitholla_assesment/core/constants/assets/svg_constants.dart';
import 'package:bitholla_assesment/core/extension/context_extension.dart';
import 'package:bitholla_assesment/core/widget/sizedBox/dynamic_horizontol_space.dart';
import 'package:bitholla_assesment/core/widget/sizedBox/dynamic_veritical_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class CoinDetailView extends StatelessWidget {
  const CoinDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SizedBox(
        width: 100.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            DynamicVerticalSpace(),
            Text(
              "\$" "6.634,51",
              style: context.textTheme.headline3!.copyWith(
                color: context.theme.colorScheme.secondary,
              ),
            ),
            DynamicVerticalSpace(
              height: 8,
            ),
            Text("14:33, 26 Jun 2018")
          ],
        ),
      ),
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
