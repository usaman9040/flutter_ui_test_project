import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/color_constants.dart';
import '../views/information_view.dart';
import '../widgets/custom_eleveated_button.dart';
import '../widgets/custom_text_field.dart';

Future<void> feedBackBottomSheet({
  required BuildContext context,
}) async {
  await showModalBottomSheet(
    useRootNavigator: true,
    enableDrag: true,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    isDismissible: true,
    context: context,
    builder: (BuildContext context) {
      return Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              height: 0.48.sh,
              width: 1.sw - 30.w,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  color: ColorConstants.purpleTextColor),
              margin: EdgeInsets.symmetric(horizontal: 15.w),
              padding: EdgeInsets.only(
                top: 20.h,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: 1.sw,
              height: 0.46.sh,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  color: ColorConstants.scaffoldBgColor),
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  12.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 20.w,
                      ),
                      Text("Give us feedback",
                          style: Theme.of(context).textTheme.bodyMedium),
                      Icon(
                        Icons.settings_outlined,
                        color: Colors.white,
                        size: 30.r,
                      )
                    ],
                  ),
                  40.verticalSpace,
                  CustomTextField(
                    controller: TextEditingController(),
                    enabled: true,
                    multiLine: 6,
                  ),
                  20.verticalSpace,
                  CustomElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    title: "Send feedback",
                  ),
                  20.verticalSpace,
                ],
              ),
            ),
          )
        ],
      );
    },
  );
}
