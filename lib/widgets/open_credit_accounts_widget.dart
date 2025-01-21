// lib/widgets/open_credit_accounts_widget.dart
import 'package:ava_finance/models/account_detail.dart';
import 'package:ava_finance/utils/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../utils/constants.dart';
import '../viewmodels/account_info_viewmodel.dart';

class OpenCreditAccountsWidget extends ConsumerWidget {
  const OpenCreditAccountsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var viewModel = ref.read(accountInfoProvider);
    return Container(
      padding: ConstantsHelper.screenHorizontalPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Open credit card accounts',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          20.verticalSpace,
          Container(
              width: 1.sw,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              decoration: ConstantsHelper.commonBoxDecoration,
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  OpenCreditCard currentCard = viewModel!.creditCard[index];
                  return _buildAccountCard(
                      context,
                      currentCard.name,
                      currentCard.percentage / 100,
                      currentCard.balance,
                      currentCard.limit,
                      DateFormat("MMMM dd, yyyy")
                          .format(currentCard.reportedOn));
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      12.verticalSpace,
                      const Divider(
                        height: 0,
                        color: Colors.grey,
                        thickness: 1,
                      ),
                      12.verticalSpace,
                    ],
                  );
                },
                itemCount: viewModel!.creditCard.length,
              )

              // Column(
              //   children: [
              //
              //     12.verticalSpace,
              //     const Divider(
              //       height: 0,
              //       color: Colors.grey,
              //       thickness: 1,
              //     ),
              //     12.verticalSpace,
              //     _buildAccountCard(
              //         context, 'Syncb/Amazon', 0.21, 1500, 6300, 'June 20, 2023'),
              //     12.verticalSpace,
              //     const Divider(
              //       height: 0,
              //       color: Colors.grey,
              //       thickness: 1,
              //     ),
              //     12.verticalSpace,
              //     _buildAccountCard(
              //         context, 'Syncb/Amazon', 0.21, 1500, 6300, 'June 20, 2023'),
              //   ],
              // ),
              )
        ],
      ),
    );
  }

  Widget _buildAccountCard(BuildContext context, String name,
      double utilization, int balance, int limit, String reportDate) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(name, style: Theme.of(context).textTheme.bodyMedium),
              Text(
                '${(utilization * 100).toStringAsFixed(0)}%',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          20.verticalSpace,
          LinearPercentIndicator(
            lineHeight: 8.h,
            padding: EdgeInsets.zero,
            animation: true,
            barRadius: Radius.circular(10.r),
            percent: utilization,
            backgroundColor: Colors.grey[200],
            progressColor: ColorConstants.secondaryColor,
          ),
          12.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${balance.toStringAsFixed(2)} Balance',
                style: Theme.of(context)
                    .textTheme
                    .displaySmall
                    ?.copyWith(fontWeight: FontWeight.normal),
              ),
              Text(
                '\$${limit.toStringAsFixed(2)} Limit',
                style: Theme.of(context)
                    .textTheme
                    .displaySmall
                    ?.copyWith(fontWeight: FontWeight.normal),
              ),
            ],
          ),
          8.verticalSpace,
          Text(
            'Reported on $reportDate',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.normal,
                color: ColorConstants.geyTextColor),
          ),
        ],
      ),
    );
  }
}
