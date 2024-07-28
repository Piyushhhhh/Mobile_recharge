import 'package:flutter/material.dart';
import 'package:mobile_recharge/values/common_widgets.dart';
import 'package:mobile_recharge/values/strings.dart';

class BeneficiaryTopUpWidgets {
  static Widget buildFixedAmountsWidget({
    required List<int> fixedAmounts,
    required int? selectedAmount,
    required void Function(int) onSelectAmount,
  }) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: fixedAmounts.map((amount) {
        return _buildAmountChip(
          amount: amount,
          isSelected: selectedAmount == amount,
          onSelectAmount: onSelectAmount,
        );
      }).toList(),
    );
  }

  static Widget _buildAmountChip({
    required int amount,
    required bool isSelected,
    required void Function(int) onSelectAmount,
  }) {
    return GestureDetector(
      onTap: () => onSelectAmount(amount),
      child: Container(
        width: 80,
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 6.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: isSelected ? const Color(0xFF5269B3) : Colors.white,
          border: Border.all(color: const Color(0xFF5269B3)),
          boxShadow: const [
            BoxShadow(
              blurRadius: 5,
              color: Colors.black12,
              offset: Offset(0, 3),
            )
          ],
        ),
        child: Center(
          child: Text(
            "AED $amount",
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  static Widget buildAmountInput({
    required TextEditingController controller,
    required void Function(String) onChanged,
  }) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        hintText: Strings.hintTextAmount,
        prefixIcon: Icon(Icons.attach_money, size: 20.0),
        border: OutlineInputBorder(),
      ),
      onChanged: onChanged,
    );
  }

  static Widget buildHeaderPage({
    required String beneficiaryNickname,
    required VoidCallback onBack,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                Strings.topUpBeneficiary
                    .replaceFirst("%s", beneficiaryNickname),
                maxLines: 2,
                style: const TextStyle(
                  color: Color(0xFF5269B3),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _buildBackButton(onBack),
          ],
        ),
        const SizedBox(height: 6.0),
        Text(
          Strings.topUpMessage,
          maxLines: 3,
          style: TextStyle(color: Colors.grey[600], fontSize: 15.0),
        ),
      ],
    );
  }

  static Widget _buildBackButton(VoidCallback onBack) {
    return InkWell(
      onTap: onBack,
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey[200],
        ),
        child:
            const Icon(Icons.arrow_back_ios, size: 18.0, color: Colors.black),
      ),
    );
  }

  static Widget buildSubmitButton({
    required VoidCallback onPressed,
  }) {
    return buildElevatedButton(
      onPressed: onPressed,
      label: Strings.topUp,
    );
  }
}
