import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/color_constants.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown(
      {super.key,
      this.title,
      required this.value,
      required this.dataList,
      required this.onChanged,
      this.enabled = false});
  final String? title;
  final String value;
  final Function(String?) onChanged;
  final List<String> dataList;

  final bool enabled;
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
          4.verticalSpace
        ],
        DropdownButtonFormField(
          onChanged: enabled ? onChanged : null,
          value: value,
          items: dataList
              .map((e) => DropdownMenuItem(
                  value: e,
                  child: Text(
                    e,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w500),
                  )))
              .toList(),
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(fontWeight: FontWeight.w500),
          icon: enabled
              ? const Icon(Icons.keyboard_arrow_down)
              : const SizedBox(),
          elevation: 0,
          decoration: InputDecoration(
            fillColor: enabled ? Colors.white : null,
            filled: enabled,
            isCollapsed: !enabled,
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
        ),
      ],
    );
  }
}
