import 'package:flutter/material.dart';
import 'package:mobile_recharge/view/add_beneficiary/widgets/beneficiary_form.dart';
import 'package:mobile_recharge/view/add_beneficiary/widgets/header.dart';

class AddBeneficiaryPage extends StatefulWidget {
  const AddBeneficiaryPage({super.key});

  @override
  State<AddBeneficiaryPage> createState() => _AddBeneficiaryPageState();
}

class _AddBeneficiaryPageState extends State<AddBeneficiaryPage> {
  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  void dispose() {
    _nicknameController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0.0),
        child: AppBar(
          backgroundColor: const Color(0xFFF8F7F7),
          elevation: 0.0,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const Header(),
                const SizedBox(height: 35),
                BeneficiaryForm(
                  nicknameController: _nicknameController,
                  phoneNumberController: _phoneNumberController,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
