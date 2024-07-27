import 'package:flutter/material.dart';
import 'package:mobile_recharge/values/strings.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              Strings.addBeneficiary,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            _buildBackButton(context),
          ],
        ),
        const SizedBox(height: 6.0),
        const Text(
          Strings.addBeneficiaryMessage,
          style: TextStyle(fontSize: 15.0, color: Colors.grey),
        )
      ],
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pop(context),
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey[200],
        ),
        child: const Icon(Icons.arrow_back_ios, size: 18.0),
      ),
    );
  }
}
