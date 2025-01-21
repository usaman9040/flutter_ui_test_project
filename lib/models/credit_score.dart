class CreditScore {
  final int score;
  final int totalScore;
  final String status;
  final int pointsChange;
  final DateTime lastUpdated;
  List<Month> monthScores;
  Month get maxScore {
    Month? maxScoreMonth;
    for (var element in monthScores) {
      if (maxScoreMonth == null || element.score > maxScoreMonth.score) {
        maxScoreMonth = element;
      }
    }
    return maxScoreMonth ?? Month(monthNumber: 0, score: 0);
  }

  Month get minScore {
    Month? minScoreMonth;
    for (var element in monthScores) {
      if (minScoreMonth == null || element.score < minScoreMonth.score) {
        minScoreMonth = element;
      }
    }
    return minScoreMonth ?? Month(monthNumber: 0, score: 0);
  }

  double get chartInterval {
    return ((maxScore.score - minScore.score) / 3).floorToDouble();
  }

  CreditScore(
      {required this.score,
      required this.totalScore,
      required this.status,
      required this.pointsChange,
      required this.lastUpdated,
      required this.monthScores});
}

class Month {
  final int monthNumber;
  final int score;

  Month({
    required this.monthNumber,
    required this.score,
  });
}
