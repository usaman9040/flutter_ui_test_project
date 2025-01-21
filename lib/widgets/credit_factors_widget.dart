// lib/widgets/credit_factors_widget.dart
import 'package:ava_finance/models/credit_factor_model.dart';
import 'package:ava_finance/utils/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/constants.dart';
import '../viewmodels/home_data_viewmodel.dart';

class CreditFactorsWidget extends ConsumerWidget {
  const CreditFactorsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var homeData = ref.read(homeDataProvider);
    return Padding(
      padding:
          EdgeInsets.only(left: ConstantsHelper.screenHorizontalPadding.left),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Credit factors',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          8.verticalSpace,
          SizedBox(
            height: 160.h,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: homeData.creditFactorList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                CreditFactorModel currentIndexData =
                    homeData.creditFactorList[index];
                return _buildFactorCard(
                    context,
                    currentIndexData.title,
                    currentIndexData.value,
                    currentIndexData.color,
                    currentIndexData.buttonText);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFactorCard(BuildContext context, String title, String value,
      Color color, String buttonTitle) {
    return Container(
      width: 144.w,
      height: 160.h,
      margin: EdgeInsets.only(right: 8.w),
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: ConstantsHelper.commonBoxDecoration,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.displaySmall,
            textAlign: TextAlign.center,
          ),
          8.verticalSpace,
          Text(
            value,
            style: Theme.of(context)
                .textTheme
                .headlineLarge
                ?.copyWith(color: ColorConstants.primaryColor),
          ),
          23.verticalSpace,
          Container(
            height: 27.h,
            width: double.infinity,
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(4.r)),
            child: Center(
              child: Text(
                buttonTitle,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 11.sp),
              ),
            ),
          )
        ],
      ),
    );
  }
}
