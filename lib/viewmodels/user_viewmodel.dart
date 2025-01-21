// lib/viewmodels/user_viewmodel.dart

import 'dart:convert';

import 'package:ava_finance/models/user.dart';
import 'package:ava_finance/utils/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel extends StateNotifier<User?> {
  UserViewModel() : super(null) {
    var getUser = ConstantsHelper.sp?.getString('user');
    if (getUser != null) {
      state = User.fromJson(jsonDecode(getUser));
    } else {
      state = User(
        employmentType: "Full time",
        employe: "Apple Inc",
        jobTitle: "Software engineer",
        annualIncome: "\$1500,000/year",
        payFrequency: "Bi-weekly",
        address: "Apple one apple park",
        payDate: DateTime(2021, 10, 10),
        years: "1 years",
        months: "1 months",
        payType: false,
      );
    }
  }

  void setUser(User user) {
    state = user;
  }
}

final userProvider =
    StateNotifierProvider<UserViewModel, User?>((ref) => UserViewModel());
