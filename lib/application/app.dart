import 'package:code_labs/screen/home_screen.dart';
import 'package:flutter/material.dart';

class CodeLabs extends StatelessWidget {
  const CodeLabs({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Code Labs',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}
