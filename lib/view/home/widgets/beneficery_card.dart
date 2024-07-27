import 'package:flutter/material.dart';
import 'package:mobile_recharge/models/beneficiary.dart';
import 'package:mobile_recharge/view/home/beneficiary_detail_screen.dart';
import 'package:mobile_recharge/view/home/widgets/beneficery_top_up_button.dart';

Widget beneficeryCard(BuildContext context, Beneficiary beneficiary) {
  return Padding(
    padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.015, vertical: 8.0),
    child: GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                BeneficiaryDetailPage(beneficiary: beneficiary),
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.35,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color(0xFFFDFDFD),
            boxShadow: const [
              BoxShadow(
                blurRadius: 5,
                color: Colors.black12,
                offset: Offset(0, 3),
              )
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
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                beneficiary.phoneNumber,
                style: TextStyle(
                    fontSize: 12,
                    letterSpacing: 1,
                    color: const Color.fromARGB(255, 112, 112, 112)
                        .withOpacity(0.9),
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
