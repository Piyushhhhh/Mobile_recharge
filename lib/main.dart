import 'package:flutter/material.dart';
import 'package:mobile_recharge/controller/beneficiary_provider.dart';
import 'package:mobile_recharge/view/home/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BeneficiaryProvider()),
      ],
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
