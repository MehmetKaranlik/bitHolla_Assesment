import 'package:bitholla_assesment/core/extension/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ChartSorterButton extends StatelessWidget {
  final bool isSelected;
  final String buttonText;
  final VoidCallback onTap;
  const ChartSorterButton({Key? key, required this.isSelected, required this.buttonText, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 3.h,
        width: 14.9.w,
        alignment: Alignment.center,
        child: Text(
          buttonText,
          style: context.textTheme.headline1!.copyWith(
            color: isSelected ? context.theme.colorScheme.background : context.theme.colorScheme.onPrimary,
            fontSize: 11.sp,
          ),
        ),
        decoration: _buildDecoration(context),
      ),
    );
  }

  BoxDecoration _buildDecoration(BuildContext context) {
    return BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(1.w)),
        color: isSelected ? context.theme.colorScheme.primary : Colors.transparent,
        boxShadow: isSelected
            ? [
                BoxShadow(
                    color: context.theme.colorScheme.onSurface,
                    offset: const Offset(0, 6),
                    blurRadius: 20,
                    spreadRadius: 3)
              ]
            : const [BoxShadow(color: Colors.transparent)]);
  }
}
