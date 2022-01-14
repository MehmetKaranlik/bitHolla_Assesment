import 'package:bitholla_assesment/core/extension/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CoinDetailTabButton extends StatefulWidget {
  final bool isSelected;
  final int itemIndex;
  final int tag;
  final String buttonText;
  final VoidCallback onTap;
  const CoinDetailTabButton(
      {Key? key,
      required this.isSelected,
      required this.itemIndex,
      required this.tag,
      required this.onTap,
      required this.buttonText})
      : super(key: key);

  @override
  _CoinDetailTabButtonState createState() => _CoinDetailTabButtonState();
}

class _CoinDetailTabButtonState extends State<CoinDetailTabButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: 20.w,
        height: 3.7.h,
        alignment: Alignment.center,
        child: _buildButtonText(context),
        decoration: _buildButtonDecoration(context),
      ),
    );
  }

  BoxDecoration _buildButtonDecoration(BuildContext context) {
    return BoxDecoration(
      borderRadius: defineBorderRadius(widget.itemIndex),
      color:
          widget.itemIndex == widget.tag ? context.theme.colorScheme.onPrimary : context.theme.colorScheme.background,
      border: Border.all(color: context.theme.colorScheme.onPrimary.withOpacity(0.4), width: 0.3.w),
    );
  }

  Text _buildButtonText(BuildContext context) {
    return Text(widget.buttonText,
        style: context.textTheme.bodyText2!.copyWith(
          fontSize: 12.sp,
          color: widget.itemIndex == widget.tag
              ? context.theme.colorScheme.background
              : context.theme.colorScheme.onPrimary,
        ));
  }

  BorderRadius defineBorderRadius(int index) {
    switch (index) {
      case 0:
        return BorderRadius.only(topLeft: Radius.circular(2.w), bottomLeft: Radius.circular(2.w));
      case 1:
        return const BorderRadius.all(Radius.circular(0));
      case 2:
        return BorderRadius.only(topRight: Radius.circular(2.w), bottomRight: Radius.circular(2.w));

      default:
        throw "";
    }
  }
}
