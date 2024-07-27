import 'package:flutter/material.dart';
import 'package:mobile_recharge/controller/beneficiary_provider.dart';
import 'package:mobile_recharge/values/strings.dart';
import 'package:mobile_recharge/view/add_beneficiary/add_beneficiary_screen.dart';
import 'package:mobile_recharge/view/home/widgets/beneficery_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.titleBeneficiaries),
      ),
      body: Consumer<BeneficiaryProvider>(
        builder: (context, provider, child) {
          return Column(
            children: [
              SizedBox(
                height: 180,
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
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddBeneficiaryPage()),
                  );
                },
                child: const Text(Strings.buttonTextAddBeneficiary),
              ),
            ],
          );
        },
      ),
    );
  }
}
