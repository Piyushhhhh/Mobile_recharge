import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_recharge/models/beneficiary.dart';
import 'package:mobile_recharge/controller/beneficiary_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  BeneficiaryProvider createProviderWithMockPrefs() {
    SharedPreferences.setMockInitialValues({});
    return BeneficiaryProvider();
  }

  group('BeneficiaryProvider', () {
    test('initial balance is 1000.0', () {
      final provider = createProviderWithMockPrefs();
      expect(provider.balance, 1000.0);
    });

    test('add beneficiary', () {
      final provider = createProviderWithMockPrefs();
      final beneficiary = Beneficiary(
        nickname: 'Test User',
        phoneNumber: '1234567890',
        isVerified: false,
        monthlyTopUp: 0.0,
      );

      provider.addBeneficiary(beneficiary);
      expect(provider.beneficiaries.length, 1);
      expect(provider.beneficiaries.first.nickname, 'Test User');
    });

    test('remove beneficiary', () {
      final provider = createProviderWithMockPrefs();
      final beneficiary = Beneficiary(
        nickname: 'Test User',
        phoneNumber: '1234567890',
        isVerified: false,
        monthlyTopUp: 0.0,
      );

      provider.addBeneficiary(beneficiary);
      expect(provider.beneficiaries.length, 1);

      provider.removeBeneficiary('1234567890');
      expect(provider.beneficiaries.length, 0);
    });

    test('top up beneficiary', () {
      final provider = createProviderWithMockPrefs();
      final beneficiary = Beneficiary(
        nickname: 'Test User',
        phoneNumber: '1234567890',
        isVerified: false,
        monthlyTopUp: 0.0,
      );

      provider.addBeneficiary(beneficiary);
      provider.topUpBeneficiary('1234567890', 50.0);
      expect(provider.beneficiaries.first.monthlyTopUp, 50.0);
      expect(provider.balance, 949.0); // 1000 - 50 - 1 (transaction fee)
    });

    test('update beneficiary', () {
      final provider = createProviderWithMockPrefs();
      final beneficiary = Beneficiary(
        nickname: 'Test User',
        phoneNumber: '1234567890',
        isVerified: false,
        monthlyTopUp: 0.0,
      );

      provider.addBeneficiary(beneficiary);
      final updatedBeneficiary = Beneficiary(
        nickname: 'Updated User',
        phoneNumber: '1234567890',
        isVerified: true,
        monthlyTopUp: 100.0,
      );

      provider.updateBeneficiary('1234567890', updatedBeneficiary);
      expect(provider.beneficiaries.first.nickname, 'Updated User');
      expect(provider.beneficiaries.first.isVerified, true);
    });
  });
}
