import 'package:code_labs/screen/home_screen.dart';
import 'package:code_labs/screen/no_internet_screen.dart';
import 'package:code_labs/service/course_api.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class CheckScreen extends StatefulWidget {
  const CheckScreen({super.key});

  @override
  State<CheckScreen> createState() => _CheckScreenState();
}

class _CheckScreenState extends State<CheckScreen> {
  @override
  void initState() {
    checkConnection();
    super.initState();
  }

  void checkConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      print('No internet connection');
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const NoInternetScreen()),
      );
    } else {
      try {
        final data = await CourseApi.divisions();
        if (data != null) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomeScreen(divisions: data)),
          );
        } else {
          // Handle null data case
          print('No data available');
        }
      } catch (e) {
        // Handle error while fetching divisions
        print('Error fetching divisions: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan.shade200,
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/checking.png',width: 150,),
            const SizedBox(height: 12),
            const Text(
                'Code Labs',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: Colors.white
              ),
            ),
          ],
        ),
      ),
    );
  }
}
