// lib/widgets/account_details_widget.dart
import 'package:ava_finance/models/account_detail.dart';
import 'package:ava_finance/utils/color_constants.dart';
import 'package:ava_finance/viewmodels/account_info_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../utils/constants.dart';

class AccountDetailsWidget extends ConsumerWidget {
  const AccountDetailsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var viewModel = ref.read(accountInfoProvider);
    return Container(
      padding: ConstantsHelper.screenHorizontalPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Account Details',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          12.verticalSpace,
          Container(
            width: 1.sw,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
            decoration: ConstantsHelper.commonBoxDecoration,
            child: Column(
              children: [
                48.verticalSpace,
                LinearPercentIndicator(
                  width: 1.sw - 75.w,
                  padding: EdgeInsets.zero,
                  percent: viewModel!.spendPerc / 100, // Example value
                  lineHeight: 8.h,
                  barRadius: Radius.circular(20.w),
                  backgroundColor: ColorConstants.secondary2Color,
                  animation: true,

                  widgetIndicator: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                          top: -48.h,
                          right: -16.w,
                          child: ClipPath(
                            clipper: MessageClipper(borderRadius: 3),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: ColorConstants.primaryColor,
                                  borderRadius: BorderRadius.circular(5.r)),
                              width: 40.w,
                              height: 37.h,
                              padding: EdgeInsets.only(bottom: 10.h),
                              child: Center(
                                child: Text(
                                  "\$${viewModel.spendBalance}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall
                                      ?.copyWith(
                                          fontWeight: FontWeight.normal,
                                          color: Colors.white),
                                ),
                              ),
                            ),
                          )),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          4.verticalSpace,
                          Container(
                            height: 8.h,
                            width: 4.w,
                            color: ColorConstants.secondaryColor,
                          ),
                        ],
                      ),
                    ],
                  ),

                  progressColor: Colors.transparent,
                ),
                8.verticalSpace,
                Text.rich(TextSpan(
                    text: "Spend limit:\$${viewModel.spendLimit}",
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          fontWeight: FontWeight.normal,
                        ),
                    children: [
                      TextSpan(
                          text: "Why is it different?",
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(color: ColorConstants.purpleTextColor))
                    ])),
                16.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "\$${viewModel.creditBalance}",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        3.verticalSpace,
                        Text(
                          "Balance",
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(fontWeight: FontWeight.normal),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "\$${viewModel.creditLimit}",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        3.verticalSpace,
                        Text(
                          "Credit limit",
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(fontWeight: FontWeight.normal),
                        )
                      ],
                    )
                  ],
                ),
                12.verticalSpace,
                const Divider(
                  height: 0,
                  thickness: 1,
                  color: Colors.grey,
                ),
                12.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Utilization",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontWeight: FontWeight.normal),
                    ),
                    Text(
                      "${viewModel.creditPerc}%",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
