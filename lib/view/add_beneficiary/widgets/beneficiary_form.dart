import 'package:flutter/material.dart';
import 'package:mobile_recharge/values/common_widgets.dart';
import 'package:provider/provider.dart';
import 'package:mobile_recharge/controller/beneficiary_provider.dart';
import 'package:mobile_recharge/models/beneficiary.dart';
import 'package:mobile_recharge/values/strings.dart';

class BeneficiaryForm extends StatelessWidget {
  final TextEditingController nicknameController;
  final TextEditingController phoneNumberController;

  const BeneficiaryForm({
    required this.nicknameController,
    required this.phoneNumberController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildTextField(
          controller: nicknameController,
          hintText: Strings.nickname,
          prefixIcon: const Icon(Icons.text_fields, size: 20.0),
        ),
        const SizedBox(height: 8.0),
        buildTextField(
          controller: phoneNumberController,
          hintText: Strings.phoneNumberHint,
          prefixIcon: const Padding(
            padding: EdgeInsets.only(top: 10, right: 8, left: 8),
            child: Text(
              "+971",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
            ),
          ),
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 12.0),
        _buildSubmitButton(context),
      ],
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    return buildElevatedButton(
      onPressed: () => _submitBeneficiary(context),
      label: Strings.submit,
    );
  }

  void _submitBeneficiary(BuildContext context) {
    final provider = Provider.of<BeneficiaryProvider>(context, listen: false);
    provider.addBeneficiary(
      Beneficiary(
        nickname: nicknameController.text,
        phoneNumber: phoneNumberController.text,
        isVerified: false,
        monthlyTopUp: 0.0,
      ),
    );
    Navigator.pop(context);
  }
}
