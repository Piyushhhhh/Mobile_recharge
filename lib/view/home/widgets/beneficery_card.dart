import 'package:flutter/material.dart';
import 'package:mobile_recharge/models/beneficiary.dart';
import 'package:mobile_recharge/view/home/widgets/beneficery_top_up_button.dart';

Widget beneficeryCard(BuildContext context, Beneficiary beneficiary) {
  return Padding(
    padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.015, vertical: 8.0),
    child: SizedBox(
      width: MediaQuery.of(context).size.width * 0.35,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color(0xFFFDFDFD),
            boxShadow: const [
              BoxShadow(
                  blurRadius: 5, color: Colors.black12, offset: Offset(0, 3))
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                beneficiary.nickname,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontSize: 10.5, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                beneficiary.phoneNumber,
                style: const TextStyle(
                    fontSize: 9.5,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 8,
              ),
              beneficiaryTopUpBtn(context, beneficiary)
            ],
          ),
        ),
      ),
    ),
  );
}
