import 'package:flutter/material.dart';
import 'package:mobile_recharge/controller/beneficiary_provider.dart';
import 'package:mobile_recharge/models/beneficiary.dart';
import 'package:mobile_recharge/view/home/widgets/beneficery_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edenred Beneficiaries'),
      ),
      body: Consumer<BeneficiaryProvider>(
        builder: (context, provider, child) {
          return Column(
            children: [
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: provider.beneficiaries.length,
                  itemBuilder: (context, index) {
                    final beneficiary = provider.beneficiaries[index];
                    return beneficeryCard(context, beneficiary);
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  provider.addBeneficiary(Beneficiary(
                    nickname: 'John Doe',
                    phoneNumber: '0501234567',
                    isVerified: false,
                    monthlyTopUp: 0.0,
                  ));
                },
                child: const Text('Add Beneficiary'),
              ),
            ],
          );
        },
      ),
    );
  }
}

class TopUpScreen extends StatelessWidget {
  final Beneficiary beneficiary;

  const TopUpScreen({super.key, required this.beneficiary});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top Up ${beneficiary.nickname}'),
      ),
      body: Consumer<BeneficiaryProvider>(
        builder: (context, provider, child) {
          return Column(
            children: [
              Text('Balance: AED ${provider.balance}'),
              TextField(
                decoration: const InputDecoration(labelText: 'Top Up Amount'),
                keyboardType: TextInputType.number,
                onSubmitted: (value) {
                  final amount = double.tryParse(value) ?? 0.0;
                  provider.topUpBeneficiary(beneficiary.phoneNumber, amount);
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
