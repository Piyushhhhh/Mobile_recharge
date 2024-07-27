import 'package:flutter/material.dart';
import 'package:mobile_recharge/values/common_widgets.dart';
import 'package:provider/provider.dart';
import 'package:mobile_recharge/controller/beneficiary_provider.dart';
import 'package:mobile_recharge/models/beneficiary.dart';
import 'package:mobile_recharge/values/strings.dart';

class BeneficiaryDetailPage extends StatefulWidget {
  final Beneficiary beneficiary;

  const BeneficiaryDetailPage({required this.beneficiary, super.key});

  @override
  State<BeneficiaryDetailPage> createState() => _BeneficiaryDetailPageState();
}

class _BeneficiaryDetailPageState extends State<BeneficiaryDetailPage> {
  late final TextEditingController _nicknameController;
  late final TextEditingController _phoneNumberController;
  late bool _isVerified;
  late double _monthlyTopUp;
  late final String _oldPhoneNumber;

  static const double _padding = 16.0;
  static const double _spacing = 8.0;

  @override
  void initState() {
    super.initState();
    _nicknameController =
        TextEditingController(text: widget.beneficiary.nickname);
    _phoneNumberController =
        TextEditingController(text: widget.beneficiary.phoneNumber);
    _isVerified = widget.beneficiary.isVerified;
    _monthlyTopUp = widget.beneficiary.monthlyTopUp;
    _oldPhoneNumber = widget.beneficiary.phoneNumber;
  }

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
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8F7F7),
        elevation: 0.0,
        title: const Text(Strings.beneficiaryDetails),
      ),
      body: Padding(
        padding: const EdgeInsets.all(_padding),
        child: Column(
          children: [
            buildTextField(
              controller: _nicknameController,
              hintText: Strings.nicknameHint,
              prefixIcon: const Icon(Icons.text_fields),
            ),
            const SizedBox(height: _spacing),
            buildTextField(
              controller: _phoneNumberController,
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
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: _spacing),
            SwitchListTile(
              title: const Text(Strings.verified),
              value: _isVerified,
              onChanged: (bool value) {
                setState(() {
                  _isVerified = value;
                });
              },
            ),
            const SizedBox(height: _spacing),
            buildElevatedButton(
              onPressed: _saveChanges,
              label: Strings.saveChanges,
            ),
            const SizedBox(height: _spacing),
            buildElevatedButton(
              onPressed: _removeBeneficiary,
              label: Strings.removeBeneficiary,
              backgroundColor: Colors.red,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  void _saveChanges() {
    final updatedBeneficiary = Beneficiary(
      nickname: _nicknameController.text,
      phoneNumber: _phoneNumberController.text,
      isVerified: _isVerified,
      monthlyTopUp: _monthlyTopUp,
    );
    Provider.of<BeneficiaryProvider>(context, listen: false)
        .updateBeneficiary(_oldPhoneNumber, updatedBeneficiary);
    Navigator.pop(context);
  }

  void _removeBeneficiary() {
    Provider.of<BeneficiaryProvider>(context, listen: false)
        .removeBeneficiary(_phoneNumberController.text);
    Navigator.pop(context);
  }
}
