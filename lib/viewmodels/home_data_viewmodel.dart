// lib/viewmodels/credit_score_viewmodel.dart
import 'package:ava_finance/models/credit_score.dart';
import 'package:ava_finance/utils/color_constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/credit_factor_model.dart';

class HomeDataViewModel {
  List<CreditFactorModel> creditFactorList = [
    CreditFactorModel(
        title: "Payment History",
        value: "100%",
        color: ColorConstants.buttonColor1,
        buttonText: "High Impact"),
    CreditFactorModel(
        title: "Credit Card Utilization",
        value: "4%",
        color: ColorConstants.secondary2Color,
        buttonText: "Low Impact"),
    CreditFactorModel(
        title: "Derogatory Marks",
        value: "2",
        color: ColorConstants.secondaryColor,
        buttonText: "Med Impact")
  ];
}

final homeDataProvider = Provider((ref) => HomeDataViewModel());
