class Beneficiary {
  String nickname;
  String phoneNumber;
  bool isVerified;
  double monthlyTopUp;

  Beneficiary({
    required this.nickname,
    required this.phoneNumber,
    this.isVerified = false,
    this.monthlyTopUp = 0.0,
  });

  // Convert a Beneficiary object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'nickname': nickname,
      'phoneNumber': phoneNumber,
      'isVerified': isVerified,
      'monthlyTopUp': monthlyTopUp,
    };
  }

  // Create a Beneficiary object from a JSON map
  factory Beneficiary.fromJson(Map<String, dynamic> json) {
    return Beneficiary(
      nickname: json['nickname'],
      phoneNumber: json['phoneNumber'],
      isVerified: json['isVerified'],
      monthlyTopUp: json['monthlyTopUp'],
    );
  }
}
