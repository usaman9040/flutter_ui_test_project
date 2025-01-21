import 'package:ava_finance/utils/constants.dart';
import 'package:ava_finance/widgets/account_details_widget.dart';
import 'package:ava_finance/widgets/chart_widget.dart';
import 'package:ava_finance/widgets/credit_factors_widget.dart';
import 'package:ava_finance/widgets/credit_score_widget.dart';
import 'package:ava_finance/widgets/custom_app_bar.dart';
import 'package:ava_finance/widgets/open_credit_accounts_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../functions/feedback_bottom_sheets.dart';
import '../utils/color_constants.dart';
import '../viewmodels/information_viewmodel.dart';
import '../widgets/custom_drop_down.dart';
import '../widgets/custom_eleveated_button.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/total_balance_widget.dart';

class InformationView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var infoViewModel = ref.watch(informationViewModel);
    return Scaffold(
      backgroundColor: ColorConstants.scaffoldBgColor,
      appBar: AppBar(
        surfaceTintColor: ColorConstants.scaffoldBgColor,
        backgroundColor: ColorConstants.scaffoldBgColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: ColorConstants.darkColor,
            size: 25.r,
          ),
          onPressed: () {
            Navigator.pop(context);
            infoViewModel.disableEdit();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: ConstantsHelper.screenHorizontalPadding,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Confirm your employment",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              "Please review and confirm the below\nemployment details are up-to-date",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: ColorConstants.geyTextColor,
                  fontWeight: FontWeight.normal),
            ),
            30.verticalSpace,
            CustomDropDown(
              enabled: infoViewModel.isEditing,
              title: "Employment type",
              value: infoViewModel.employmentType.text,
              onChanged: infoViewModel.onEmploymentChanged,
              dataList: infoViewModel.employmentTypeList,
            ),
            12.verticalSpace,
            CustomTextField(
              enabled: infoViewModel.isEditing,
              title: "Employer",
              controller: infoViewModel.employer,
            ),
            12.verticalSpace,
            CustomTextField(
              enabled: infoViewModel.isEditing,
              title: "Job title",
              controller: infoViewModel.jobTitle,
            ),
            12.verticalSpace,
            CustomTextField(
              enabled: infoViewModel.isEditing,
              title: "Gross annual income",
              controller: infoViewModel.grossAnnualIncome,
            ),
            12.verticalSpace,
            CustomDropDown(
              enabled: infoViewModel.isEditing,
              title: "Pay frequency",
              value: infoViewModel.payFrequency.text,
              onChanged: infoViewModel.onPayFrequencyChanged,
              dataList: infoViewModel.payFrequencyList,
            ),
            12.verticalSpace,
            CustomTextField(
              multiLine: infoViewModel.isEditing ? 2 : 1,
              enabled: infoViewModel.isEditing,
              title: "Employer address",
              controller: infoViewModel.employerAddress,
            ),
            12.verticalSpace,
            infoViewModel.isEditing
                ? SizedBox(
                    width: 1.sw,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: CustomDropDown(
                            title: "Time with employer",
                            enabled: infoViewModel.isEditing,
                            value: infoViewModel.years!,
                            onChanged: infoViewModel.onYearChanged,
                            dataList: infoViewModel.yearsList,
                          ),
                        ),
                        5.horizontalSpace,
                        Expanded(
                          child: CustomDropDown(
                            enabled: infoViewModel.isEditing,
                            value: infoViewModel.months!,
                            onChanged: infoViewModel.onMonthsChanged,
                            dataList: infoViewModel.monthsList,
                          ),
                        ),
                      ],
                    ),
                  )
                : CustomTextField(
                    enabled: infoViewModel.isEditing,
                    title: "Time with employer",
                    controller: infoViewModel.timeWithEmployer,
                  ),
            12.verticalSpace,
            CustomTextField(
              isDateSelection: true,
              enabled: infoViewModel.isEditing,
              title: "Next pay day",
              controller: infoViewModel.nextPayDate,
            ),
            12.verticalSpace,
            infoViewModel.isEditing
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Is your pay a direct deposit",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      4.verticalSpace,
                      Row(
                        children: [
                          Transform.scale(
                            scale: 1.5,
                            child: Radio(
                                value: true,
                                fillColor:
                                    MaterialStateProperty.resolveWith((states) {
                                  if (states.contains(MaterialState.selected)) {
                                    return ColorConstants.primaryColor;
                                  }
                                  return Colors.white;
                                }),
                                groupValue: infoViewModel.isDirectDeposit,
                                onChanged: infoViewModel.changeDirectDeposit),
                          ),
                          Text(
                            "Yes",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(fontWeight: FontWeight.normal),
                          ),
                          50.horizontalSpace,
                          Transform.scale(
                            scale: 1.5,
                            child: Radio(
                                value: false,
                                fillColor:
                                    MaterialStateProperty.resolveWith((states) {
                                  if (states.contains(MaterialState.selected)) {
                                    return ColorConstants.primaryColor;
                                  }
                                  return Colors.white;
                                }),
                                groupValue: infoViewModel.isDirectDeposit,
                                onChanged: infoViewModel.changeDirectDeposit),
                          ),
                          Text(
                            "No",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ],
                  )
                : CustomTextField(
                    enabled: infoViewModel.isEditing,
                    title: "Is your pay a direct deposit",
                    controller: infoViewModel.payType,
                  ),
            infoViewModel.isEditing ? 50.verticalSpace : 30.verticalSpace,
            infoViewModel.isEditing
                ? CustomElevatedButton(
                    onPressed: () {
                      infoViewModel.updateUser(ref);
                    },
                    title: "Continue",
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomElevatedButton(
                        onPressed: () {
                          infoViewModel.enableEdit();
                        },
                        title: "Edit",
                        isBordered: true,
                      ),
                      8.verticalSpace,
                      CustomElevatedButton(
                        onPressed: () async {
                          Navigator.pop(context);
                          feedBackBottomSheet(context: context);
                        },
                        title: "Confirm",
                      ),
                    ],
                  ),
            30.verticalSpace,
          ]),
        ),
      ),
    );
  }
}
