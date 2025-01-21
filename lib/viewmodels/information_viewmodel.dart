// lib/viewmodels/user_viewmodel.dart

import 'dart:convert';

import 'package:ava_finance/models/user.dart';
import 'package:ava_finance/viewmodels/user_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../utils/constants.dart';

class InformationViewModel extends ChangeNotifier {
  InformationViewModel({required User user}) {
    setUpData(user);
  }

  void setUpData(User user) {
    var currentDate = DateTime.now();
    if (user.payDate.day > currentDate.day) {
      currentDate = currentDate.copyWith(month: currentDate.month + 1);
    }
    employmentType.text = user.employmentType;
    employer.text = user.employe;
    jobTitle.text = user.jobTitle;
    grossAnnualIncome.text = user.annualIncome;
    payFrequency.text = user.payFrequency;
    employerAddress.text = user.address;
    timeWithEmployer.text = "${user.years} ${user.months} ";
    nextPayDate.text = DateFormat("MMM dd ,yyyy(EEEE)").format(user.payDate);
    payType.text = user.payType.toString();
    months = user.months;
    years = user.years;
    isDirectDeposit = user.payType;
  }

  String? months;
  String? years;
  TextEditingController employmentType = TextEditingController();
  TextEditingController employer = TextEditingController();
  TextEditingController jobTitle = TextEditingController();
  TextEditingController grossAnnualIncome = TextEditingController();
  TextEditingController payFrequency = TextEditingController();
  TextEditingController employerAddress = TextEditingController();
  TextEditingController timeWithEmployer = TextEditingController();
  TextEditingController nextPayDate = TextEditingController();
  TextEditingController payType = TextEditingController();

  bool isEditing = false;
  bool isDirectDeposit = false;

  List<String> employmentTypeList = [
    "Full time",
    "Part time",
    "Self employed",
    "Contractor",
    "Casual",
    "Unemployed",
    "Pensioner",
    "Student",
    "Other"
  ];
  List<String> payFrequencyList = [
    "Bi-weekly",
    "Weekly",
    "Monthly",
    "Yearly",
  ];

  List<String> yearsList = List.generate(20, (index) => "${index + 1} years");
  List<String> monthsList = List.generate(12, (index) => "${index + 1} months");

  changeDirectDeposit(bool? value) {
    isDirectDeposit = value!;
    notifyListeners();
  }

  onYearChanged(String? value) {
    years = value!;
    notifyListeners();
  }

  onMonthsChanged(String? value) {
    months = value!;
    notifyListeners();
  }

  onPayFrequencyChanged(String? value) {
    payFrequency.text = value!;
    notifyListeners();
  }

  void enableEdit() {
    isEditing = true;
    notifyListeners();
  }

  onEmploymentChanged(String? value) {
    employmentType.text = value!;
    notifyListeners();
  }

  Future<void> updateUser(WidgetRef ref) async {
    User newUser = User(
      employmentType: employmentType.text,
      employe: employer.text,
      jobTitle: jobTitle.text,
      annualIncome: grossAnnualIncome.text,
      payFrequency: payFrequency.text,
      address: employerAddress.text,
      payDate: DateFormat("MMM dd ,yyyy(EEEE)").parse(nextPayDate.text),
      years: years!,
      months: months!,
      payType: isDirectDeposit,
    );

    await ConstantsHelper.sp?.setString(
        'user',
        jsonEncode(
          newUser.toJson(),
        ));

    isEditing = false;

    setUpData(newUser);
    notifyListeners();
  }

  void disableEdit() {
    isEditing = false;
    notifyListeners();
  }
}

final informationViewModel = ChangeNotifierProvider((ref) {
  var user = ref.read(userProvider.notifier);
  return InformationViewModel(user: user.state!);
});
