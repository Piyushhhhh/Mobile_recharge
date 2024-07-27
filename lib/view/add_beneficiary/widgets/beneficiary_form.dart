import 'package:flutter/material.dart';
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
        _buildTextField(
          controller: nicknameController,
          hintText: Strings.nickname,
          prefixIcon: const Icon(Icons.text_fields, size: 20.0),
        ),
        const SizedBox(height: 8.0),
        _buildTextField(
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

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required Widget prefixIcon,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      keyboardType: keyboardType,
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _submitBeneficiary(context),
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: const Text(
        Strings.submit,
        style: TextStyle(fontSize: 16),
      ),
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
