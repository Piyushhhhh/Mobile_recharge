import 'package:flutter/material.dart';
import 'package:mobile_recharge/models/beneficiary.dart';
import 'package:mobile_recharge/values/common_widgets.dart';
import 'package:mobile_recharge/values/strings.dart';
import 'package:mobile_recharge/view/top_up.dart/top_up_screen.dart';

Widget beneficiaryTopUpBtn(BuildContext context, Beneficiary beneficiary) {
  return buildElevatedButton(
      onPressed: () async {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BeneficiaryTopUpPage(beneficiary.nickname),
          ),
        );
      },
      label: Strings.rechargeNow,
      fontSize: 12,
      buttonHeight: 30);
}
