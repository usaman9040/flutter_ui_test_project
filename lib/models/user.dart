// lib/models/user.dart
class User {
  final String employmentType;
  final String employe;
  final String jobTitle;
  final String annualIncome;
  final String payFrequency;
  final String address;
  final DateTime payDate;
  final String years;
  final String months;
  final bool payType;

  User({
    required this.employmentType,
    required this.employe,
    required this.jobTitle,
    required this.annualIncome,
    required this.payFrequency,
    required this.address,
    required this.payDate,
    required this.payType,
    required this.years,
    required this.months,
  });

  User.fromJson(Map<String, dynamic> json)
      : address = json["address"] ?? "",
        annualIncome = json["annualIncome"] ?? "",
        employe = json["employe"] ?? "",
        employmentType = json["employmentType"] ?? "",
        jobTitle = json["jobTitle"] ?? "",
        payDate = DateTime.parse(json["joiningDate"]) ?? DateTime.now(),
        payFrequency = json["payFrequency"] ?? "",
        years = json["years"] ?? "",
        months = json["months"] ?? "",
        payType = json["payType"] ?? false;

  Map<String, dynamic> toJson() => {
        'address': address,
        'annualIncome': annualIncome,
        'employe': employe,
        'employmentType': employmentType,
        'jobTitle': jobTitle,
        'joiningDate': payDate.toString(),
        'payFrequency': payFrequency,
        'payType': payType,
        "years": years,
        "months": months
      };
}
