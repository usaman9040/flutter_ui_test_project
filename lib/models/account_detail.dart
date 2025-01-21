class AccountInfo {
  final int spendLimit;
  final int spendBalance;
  final int creditBalance;
  final int creditLimit;
  final int totalBalance;
  final int totalLimit;
  final List<OpenCreditCard> creditCard;
  int get spendPerc => (spendBalance / spendLimit * 100).toInt();
  int get creditPerc => (creditBalance / creditLimit * 100).toInt();
  int get totalPerc => (totalBalance / totalLimit * 100).toInt();

  AccountInfo(
      {required this.spendBalance,
      required this.creditBalance,
      required this.creditLimit,
      required this.totalBalance,
      required this.totalLimit,
      required this.spendLimit,
      required this.creditCard});
}

class OpenCreditCard {
  String name;
  int balance;
  int limit;
  DateTime reportedOn;
  int get percentage => (balance / limit * 100).toInt();

  OpenCreditCard(
      {required this.name,
      required this.balance,
      required this.limit,
      required this.reportedOn});
}
