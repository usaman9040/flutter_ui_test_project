// lib/viewmodels/credit_score_viewmodel.dart
import 'package:ava_finance/models/credit_score.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreditScoreViewModel extends StateNotifier<CreditScore?> {
  CreditScoreViewModel() : super(null) {
    state = CreditScore(
        score: 720,
        totalScore: 1000,
        status: "Good",
        pointsChange: 1000,
        lastUpdated: DateTime.now(),
        monthScores: [
          Month(monthNumber: 0, score: 610),
          Month(monthNumber: 1, score: 650),
          Month(monthNumber: 2, score: 640),
          Month(monthNumber: 3, score: 630),
          Month(monthNumber: 4, score: 690),
          Month(monthNumber: 5, score: 640),
          Month(monthNumber: 6, score: 660),
          Month(monthNumber: 7, score: 680),
          Month(monthNumber: 8, score: 620),
          Month(monthNumber: 9, score: 625),
          Month(monthNumber: 10, score: 690),
          Month(monthNumber: 11, score: 700),
        ]);
  }

  void updateCreditScore(CreditScore creditScore) {
    state = creditScore;
  }
}

final creditScoreProvider =
    StateNotifierProvider<CreditScoreViewModel, CreditScore?>(
        (ref) => CreditScoreViewModel());
