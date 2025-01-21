import 'package:auto_size_text/auto_size_text.dart';
import 'package:ava_finance/utils/color_constants.dart';
import 'package:ava_finance/viewmodels/credit_score_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../utils/constants.dart';

class CreditScoreWidget extends ConsumerWidget {
  const CreditScoreWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final creditScore = ref.watch(creditScoreProvider);

    return Container(
      width: 1.sw,
      height: 132.h,
      padding: EdgeInsets.fromLTRB(20.w, 4.h, 20.w, 0),
      decoration: BoxDecoration(
        color: ColorConstants.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32.r),
          bottomRight: Radius.circular(32.r),
        ),
      ),
      child: Column(
        children: [
          Container(
            height: 104.h,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: ConstantsHelper.commonBoxDecoration
                .copyWith(borderRadius: BorderRadius.circular(20.r)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Credit Score',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        'Updated Today | Next May 12',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: ColorConstants.geyTextColor),
                      ),
                      10.verticalSpace,
                      Text(
                        'Experian',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(color: ColorConstants.primaryColor),
                      ),
                    ],
                  ),
                ),
                5.horizontalSpace,
                CircularPercentIndicator(
                  radius: 45.r,
                  lineWidth: 5.w,
                  center: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 13.w),
                          child: AutoSizeText(
                            creditScore?.score.toString() ?? '0',
                            style: Theme.of(context).textTheme.displayLarge,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          creditScore?.status ?? 'Good',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        5.verticalSpace,
                      ],
                    ),
                  ),
                  percent: ((creditScore?.score ?? 0) /
                          (creditScore?.totalScore ?? 1))
                      .toDouble(),
                  progressColor: ColorConstants.secondaryColor,
                  animation: true,
                  backgroundColor: ColorConstants.secondary2Color,
                  startAngle: 180,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
