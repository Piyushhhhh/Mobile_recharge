import 'package:flutter/material.dart';
import 'package:mobile_recharge/controller/beneficiary_provider.dart';
import 'package:mobile_recharge/models/beneficiary.dart';
import 'package:mobile_recharge/view/home/widgets/beneficery_top_up_button.dart';
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

Widget beneficeryCard(BuildContext context, Beneficiary beneficiary) {
  return Padding(
    padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.015, vertical: 8.0),
    child: SizedBox(
      width: MediaQuery.of(context).size.width * 0.35,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color(0xFFFDFDFD),
            boxShadow: const [
              BoxShadow(
                  blurRadius: 5, color: Colors.black12, offset: Offset(0, 3))
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                beneficiary.nickname,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontSize: 10.5,
                    // color: MAIN1,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(beneficiary.phoneNumber,
                  style: const TextStyle(
                      fontSize: 9.5,
                      // color: TEXT_FIELD_HINT_COLOR,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w500)),
              const SizedBox(
                height: 8,
              ),
              beneficiaryTopUpBtn(context, beneficiary)
            ],
          ),
        ),
      ),
    ),
  );
}
