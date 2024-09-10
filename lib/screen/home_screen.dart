import 'package:code_labs/components/category_view.dart';
import 'package:code_labs/model/division.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final List<Division> divisions;
  HomeScreen({super.key, required this.divisions});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Division> allDivisions = [];

  @override
  void initState() {
    setState(() {
      allDivisions = widget.divisions;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Code Labs'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
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
                    itemCount: allDivisions.length,
                    itemBuilder: (BuildContext context , int index){
                      return CategoryView(items: allDivisions[index].categories, name: allDivisions[index].name);
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
