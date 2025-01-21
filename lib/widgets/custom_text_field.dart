import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../utils/color_constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.title,
      required this.controller,
      this.isDateSelection = false,
      this.multiLine = 1,
      this.enabled = false});
  final String? title;
  final TextEditingController controller;
  final bool enabled;
  final bool isDateSelection;
  final int multiLine;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          Text(
            title!,
            style: enabled
                ? Theme.of(context).textTheme.titleMedium
                : Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: ColorConstants.geyTextColor),
          ),
          4.verticalSpace,
        ],
        TextFormField(
          maxLines: multiLine,
          controller: controller,
          readOnly: !enabled || isDateSelection,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(fontWeight: FontWeight.w500),
          onTap: () {
            if (isDateSelection) {
              showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
              ).then((value) {
                if (value != null) {
                  controller.text =
                      DateFormat("MMM dd ,yyyy(EEEE)").format(value);
                }
              });
            }
          },
          decoration: InputDecoration(
            fillColor: enabled ? Colors.white : null,
            filled: enabled,
            isCollapsed: !enabled,
            suffix: isDateSelection && enabled
                ? const Icon(
                    Icons.calendar_today,
                    color: ColorConstants.darkColor,
                  )
                : null,
            border: enabled
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.r),
                    borderSide: BorderSide(
                      color: ColorConstants.darkColor.withOpacity(0.15),
                    ),
                  )
                : InputBorder.none,
            focusedBorder: enabled
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.r),
                    borderSide: BorderSide(
                      color: ColorConstants.darkColor.withOpacity(0.15),
                    ),
                  )
                : InputBorder.none,
            disabledBorder: enabled
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.r),
                    borderSide: BorderSide(
                      color: ColorConstants.darkColor.withOpacity(0.15),
                    ),
                  )
                : InputBorder.none,
            enabledBorder: enabled
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.r),
                    borderSide: BorderSide(
                      color: ColorConstants.darkColor.withOpacity(0.15),
                    ),
                  )
                : InputBorder.none,
            errorBorder: enabled
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.r),
                    borderSide: BorderSide(
                      color: ColorConstants.darkColor.withOpacity(0.15),
                    ),
                  )
                : InputBorder.none,
            focusedErrorBorder: enabled
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.r),
                    borderSide: BorderSide(
                      color: ColorConstants.darkColor.withOpacity(0.15),
                    ),
                  )
                : InputBorder.none,
          ),
        )
      ],
    );
  }
}
