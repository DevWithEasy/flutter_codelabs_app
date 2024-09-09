import 'dart:convert';

import 'package:code_labs/components/category_view.dart';
import 'package:code_labs/model/division.dart';
import 'package:code_labs/service/course_api.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Division> divisions = [];
  bool loading = false;

  @override
  void initState() {
    fetchDivision();
    super.initState();
  }


  void fetchDivision()async{
    loading = true;
    final data = await CourseApi.divisions();
    setState(() {
      divisions = data;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: loading ? null :  AppBar(
        title: const Text('Code Labs'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SafeArea(
        child: loading ?
        Center(
            child: Lottie.asset(
                'assets/animation/coding.json',
                width: 200,
                height: 200,
                fit: BoxFit.fill,
            )
        )
            :
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Learning video resource for new learner. Free best video course that you start your learning journey.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 16),
                ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: divisions.length,
                    itemBuilder: (BuildContext context , int index){
                      return CategoryView(items: divisions[index].categories, name: divisions[index].name);
                    }
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
