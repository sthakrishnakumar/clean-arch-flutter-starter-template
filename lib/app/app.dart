import 'package:flutter/material.dart';
import 'package:naasa_x/home.dart';

class NaasaXApp extends StatelessWidget {
  const NaasaXApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Naasa X',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Home(),
    );
  }
}
