import 'package:flutter/material.dart';
import 'package:mobile_recharge/models/beneficiary.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class BeneficiaryProvider with ChangeNotifier {
  List<Beneficiary> _beneficiaries = [];
  double _balance = 1000.0; // Assuming initial balance

  List<Beneficiary> get beneficiaries => _beneficiaries;
  double get balance => _balance;

  BeneficiaryProvider() {
    loadFromPrefs();
  }

  void addBeneficiary(Beneficiary beneficiary) {
    if (_beneficiaries.length < 5) {
      _beneficiaries.add(beneficiary);
      saveToPrefs();
      notifyListeners();
    }
  }

  void removeBeneficiary(String phoneNumber) {
    _beneficiaries.removeWhere((b) => b.phoneNumber == phoneNumber);
    saveToPrefs();
    notifyListeners();
  }

  void topUpBeneficiary(String phoneNumber, double amount) {
    final beneficiary =
        _beneficiaries.firstWhere((b) => b.phoneNumber == phoneNumber);
    if ((beneficiary.monthlyTopUp + amount <= 1000.0 &&
            !beneficiary.isVerified) ||
        (beneficiary.monthlyTopUp + amount <= 500.0 &&
            beneficiary.isVerified)) {
      if (_balance >= amount + 1) {
        _balance -= (amount + 1);
        beneficiary.monthlyTopUp += amount;
        saveToPrefs();
        notifyListeners();
      }
    }
  }

  void updateBeneficiary(
      String oldPhoneNumber, Beneficiary updatedBeneficiary) {
    final index =
        _beneficiaries.indexWhere((b) => b.phoneNumber == oldPhoneNumber);
    if (index != -1) {
      _beneficiaries[index] = updatedBeneficiary;
      saveToPrefs();
      notifyListeners();
    }
  }

  void saveToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> beneficiariesJson =
        _beneficiaries.map((b) => jsonEncode(b.toJson())).toList();
    prefs.setStringList('beneficiaries', beneficiariesJson);
    prefs.setDouble('balance', _balance);
  }

  void loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? beneficiariesJson = prefs.getStringList('beneficiaries');
    if (beneficiariesJson != null) {
      _beneficiaries = beneficiariesJson
          .map((b) => Beneficiary.fromJson(jsonDecode(b)))
          .toList();
    }
    _balance = prefs.getDouble('balance') ?? 1000.0;
    notifyListeners();
  }
}
