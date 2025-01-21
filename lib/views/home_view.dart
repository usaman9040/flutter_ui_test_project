// lib/views/home_view.dart
import 'package:ava_finance/widgets/account_details_widget.dart';
import 'package:ava_finance/widgets/chart_widget.dart';
import 'package:ava_finance/widgets/credit_factors_widget.dart';
import 'package:ava_finance/widgets/credit_score_widget.dart';
import 'package:ava_finance/widgets/custom_app_bar.dart';
import 'package:ava_finance/widgets/open_credit_accounts_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/color_constants.dart';
import '../widgets/total_balance_widget.dart';
import 'information_view.dart';

class HomeView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: ColorConstants.scaffoldBgColor,
      appBar: CustomAppBar(
        title: "Home",
        iconData: Icons.settings_outlined,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => InformationView()));
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const CreditScoreWidget(),
            32.verticalSpace,
            const ChartWidget(),
            40.verticalSpace,
            const CreditFactorsWidget(),
            24.verticalSpace,
            const AccountDetailsWidget(),
            34.verticalSpace,
            const TotalBalanceWidget(),
            20.verticalSpace,
            const OpenCreditAccountsWidget(),
            30.verticalSpace,
          ],
        ),
      ),
    );
  }
}
