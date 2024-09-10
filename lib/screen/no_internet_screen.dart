import 'package:code_labs/screen/check_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(
                'assets/animation/no_internet.json',
                width: 200,
                height: 200
            ),
            const Text('No Internet'),
            const Text('Please connect with internet'),
            const SizedBox(height: 12),
            ElevatedButton(
                onPressed: (){
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> const CheckScreen()));
                },
                child: const Text('Refresh')
            )
          ],
        ),
      ),
    );
  }
}
