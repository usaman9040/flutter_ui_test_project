import 'package:auto_size_text/auto_size_text.dart';
import 'package:ava_finance/utils/color_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../utils/constants.dart';
import '../viewmodels/account_info_viewmodel.dart';

class TotalBalanceWidget extends ConsumerWidget {
  const TotalBalanceWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var viewModel = ref.read(accountInfoProvider);
    return Container(
      padding: ConstantsHelper.screenHorizontalPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 1.sw,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            decoration: ConstantsHelper.commonBoxDecoration,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text.rich(TextSpan(
                              text: "Total Balance:",
                              style: Theme.of(context).textTheme.bodyMedium,
                              children: [
                                TextSpan(
                                    text: "\$${viewModel!.totalBalance}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                            color:
                                                ColorConstants.secondaryColor))
                              ])),
                          6.verticalSpace,
                          Text.rich(TextSpan(
                            text: "Total Limit:\$${viewModel!.totalLimit}",
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall
                                ?.copyWith(fontWeight: FontWeight.normal),
                          )),
                        ],
                      ),
                    ),
                    5.horizontalSpace,
                    CircularPercentIndicator(
                      radius: 43.r,
                      lineWidth: 5.w,
                      center: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 13.w),
                              child: AutoSizeText(
                                '${viewModel.totalPerc}%',
                                style: Theme.of(context).textTheme.displayLarge,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Text(
                              'Excellent',
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            5.verticalSpace,
                          ],
                        ),
                      ),
                      percent: 0.2,
                      progressColor: ColorConstants.secondaryColor,
                      animation: true,
                      backgroundColor: ColorConstants.secondary2Color,
                    ),
                  ],
                ),
                8.verticalSpace,
                SizedBox(
                  width: 1.sw,
                  child: const Row(
                    children: [
                      IndicatorPart(
                        containerColor: ColorConstants.containerColor3,
                        firstText: "0-9%",
                        isFirst: true,
                        isFirstTextSelected: true,
                        lastText: "10-29%",
                      ),
                      IndicatorPart(
                        containerColor: ColorConstants.containerColor1,
                        firstText: "30-49%",
                        isCenetr: true,
                      ),
                      IndicatorPart(
                        containerColor: ColorConstants.containerColor2,
                        firstText: "30-49%",
                        isLast: true,
                        lastText: "<75%",
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class IndicatorPart extends StatelessWidget {
  const IndicatorPart({
    super.key,
    this.isFirst = false,
    this.isLast = false,
    required this.containerColor,
    required this.firstText,
    this.isCenetr = false,
    this.lastText,
    this.isFirstTextSelected = false,
    this.isLastTextSelected = false,
  });
  final bool isFirst;
  final bool isLast;
  final bool isCenetr;
  final bool isFirstTextSelected;
  final bool isLastTextSelected;
  final Color containerColor;
  final String firstText;
  final String? lastText;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            (isFirstTextSelected || isLastTextSelected)
                ? isFirst
                    ? "Excellent"
                    : isCenetr
                        ? "Medium"
                        : "Bad"
                : "",
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: containerColor),
          ),
          8.verticalSpace,
          Container(
            width: double.infinity,
            height: 24.h,
            decoration: BoxDecoration(
                color: containerColor,
                borderRadius: BorderRadius.horizontal(
                    left: isFirst ? Radius.circular(5.r) : Radius.zero,
                    right: isLast ? Radius.circular(5.r) : Radius.zero)),
          ),
          Row(
            mainAxisAlignment: isCenetr
                ? MainAxisAlignment.center
                : MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: isCenetr
                    ? CrossAxisAlignment.center
                    : CrossAxisAlignment.start,
                children: [
                  3.verticalSpace,
                  Container(
                    height: 10.h,
                    width: 1.w,
                    color: isFirstTextSelected
                        ? ColorConstants.secondaryColor
                        : Colors.grey,
                  ),
                  5.verticalSpace,
                  Text(
                    firstText,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: isFirstTextSelected
                            ? ColorConstants.secondaryColor
                            : ColorConstants.geyTextColor,
                        fontWeight: isFirstTextSelected
                            ? FontWeight.w600
                            : FontWeight.normal),
                  )
                ],
              ),
              if (!isCenetr)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    3.verticalSpace,
                    Container(
                      height: 10.h,
                      width: 1.w,
                      color: isLastTextSelected
                          ? ColorConstants.secondaryColor
                          : Colors.grey,
                    ),
                    5.verticalSpace,
                    Text(
                      lastText!,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: isLastTextSelected
                              ? ColorConstants.secondaryColor
                              : ColorConstants.geyTextColor,
                          fontWeight: isLastTextSelected
                              ? FontWeight.w600
                              : FontWeight.normal),
                    )
                  ],
                ),
            ],
          )
        ],
      ),
    );
  }
}
