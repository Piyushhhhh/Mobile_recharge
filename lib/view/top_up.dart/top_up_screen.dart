import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobile_recharge/controller/beneficiary_provider.dart';
import 'package:mobile_recharge/view/top_up.dart/widgets/top_up_widgets.dart';
import 'package:provider/provider.dart';

class BeneficiaryTopUpPage extends StatefulWidget {
  final String beneficiaryNickname;
  final String beneficiaryNumber;

  const BeneficiaryTopUpPage(this.beneficiaryNickname, this.beneficiaryNumber,
      {super.key});

  @override
  State<BeneficiaryTopUpPage> createState() => _BeneficiaryTopUpPageState();
}

class _BeneficiaryTopUpPageState extends State<BeneficiaryTopUpPage> {
  final TextEditingController _amountController = TextEditingController();
  final List<int> _fixedAmounts = [5, 10, 20, 30, 50, 75, 100];
  int? _selectedAmount;

  @override
  void dispose() {
    _amountController.dispose();
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
                BeneficiaryTopUpWidgets.buildHeaderPage(
                  beneficiaryNickname: widget.beneficiaryNickname,
                  onBack: () => Navigator.pop(context),
                ),
                const SizedBox(height: 35),
                BeneficiaryTopUpWidgets.buildAmountInput(
                  controller: _amountController,
                  onChanged: (value) => _selectAmount(int.tryParse(value)),
                ),
                const SizedBox(height: 12.0),
                BeneficiaryTopUpWidgets.buildFixedAmountsWidget(
                  fixedAmounts: _fixedAmounts,
                  selectedAmount: _selectedAmount,
                  onSelectAmount: _selectAmount,
                ),
                const SizedBox(height: 12.0),
                BeneficiaryTopUpWidgets.buildSubmitButton(
                  onPressed: _handleTopUp,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _selectAmount(int? amount) {
    setState(() {
      _selectedAmount = amount;
      if (amount != null) {
        _amountController.text = amount.toString();
      }
    });
  }

  void _handleTopUp() {
    if (kDebugMode) {
      print("Top up: ${_amountController.text}");
    }
    final provider = Provider.of<BeneficiaryProvider>(context, listen: false);
    provider.topUpBeneficiary(
        widget.beneficiaryNumber, double.parse(_amountController.text));
    Navigator.pop(context);
  }
}
