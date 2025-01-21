import 'package:ava_finance/utils/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {super.key,
      required this.title,
      required this.onPressed,
      this.isBordered = false});
  final String title;
  final Function() onPressed;
  final bool isBordered;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            side:
                const BorderSide(color: ColorConstants.primaryColor, width: 1),
            backgroundColor: isBordered
                ? ColorConstants.scaffoldBgColor
                : ColorConstants.primaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r)),
            elevation: 0,
            fixedSize: Size(1.sw - 32.w, 44.h)),
        onPressed: () {
          onPressed?.call();
        },
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color:
                      isBordered ? ColorConstants.primaryColor : Colors.white,
                ),
          ),
        ));
  }
}
