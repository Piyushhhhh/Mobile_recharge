import 'package:flutter/material.dart';
import 'package:mobile_recharge/models/beneficiary.dart';
import 'package:mobile_recharge/values/strings.dart';
import 'package:mobile_recharge/view/top_up.dart/top_up_screen.dart';

Widget beneficiaryTopUpBtn(BuildContext context, Beneficiary beneficiary) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BeneficiaryTopUpPage(beneficiary.nickname),
        ),
      );
    },
    child: Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          gradient:
              LinearGradient(colors: [Color(0xff5269B3), Color(0XFF6E8ECD)]),
          boxShadow: [
            BoxShadow(
                blurRadius: 5, color: Colors.black12, offset: Offset(0, 3))
          ]),
      child: const Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 8.0),
          child: Text(
            Strings.rechargeNow,
            style: TextStyle(
                color: Colors.white, fontSize: 9, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    ),
  );
}
