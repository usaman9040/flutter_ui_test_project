// lib/viewmodels/credit_score_viewmodel.dart
import 'package:ava_finance/models/account_detail.dart';
import 'package:ava_finance/models/credit_score.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AccountInfoViewModel extends StateNotifier<AccountInfo?> {
  AccountInfoViewModel() : super(null) {
    state = AccountInfo(
        spendBalance: 75,
        creditBalance: 30,
        creditLimit: 600,
        totalBalance: 8300,
        totalLimit: 200900,
        spendLimit: 100,
        creditCard: [
          OpenCreditCard(
              name: "Syncb/Amazon",
              balance: 1500,
              limit: 6300,
              reportedOn: DateTime(2023, 6, 21)),
          OpenCreditCard(
              name: "Syncb/Amazon2",
              balance: 500,
              limit: 7300,
              reportedOn: DateTime(2024, 6, 25)),
          OpenCreditCard(
              name: "Syncb/Amazon3",
              balance: 5000,
              limit: 7000,
              reportedOn: DateTime(2020, 2, 10)),
        ]);
  }
  void updateCreditScore(AccountInfo accountInfo) {
    state = accountInfo;
  }
}

final accountInfoProvider =
    StateNotifierProvider<AccountInfoViewModel, AccountInfo?>(
        (ref) => AccountInfoViewModel());
