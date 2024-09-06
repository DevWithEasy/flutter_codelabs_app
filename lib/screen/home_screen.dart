import 'package:code_labs/components/category_view.dart';
import 'package:code_labs/service/course_api.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List devs = [
    {'id': 1, 'title': 'Apps', 'image': 'assets/images/app_dev.png'},
    {'id': 2, 'title': 'Web', 'image': 'assets/images/web_dev.png'}
  ];

  final List language = [
    {'id': 1, 'title': 'JavaScript', 'image': 'assets/images/js.png'},
    {'id': 2, 'title': 'PHP', 'image': 'assets/images/php.png'},
    {'id': 3, 'title': 'Python', 'image': 'assets/images/python.png'},
    {'id': 4, 'title': 'Dart', 'image': 'assets/images/dart.png'},
    {'id': 5, 'title': 'C++', 'image': 'assets/images/c_plus.png'},
    {'id': 6, 'title': 'C#', 'image': 'assets/images/c_sharp.png'}
  ];

  final List web = [
    {'id': 1, 'title': 'HTML', 'image': 'assets/images/html.png'},
    {'id': 2, 'title': 'CSS', 'image': 'assets/images/css.png'},
    {'id': 3, 'title': 'Bootstrap', 'image': 'assets/images/bootstrap.png'},
    {'id': 4, 'title': 'Tailwind Css', 'image': 'assets/images/tailwind.png'},
    {'id': 5, 'title': 'React JS', 'image': 'assets/images/react.png'},
    {'id': 6, 'title': 'Node JS', 'image': 'assets/images/nodejs.png'},
    {'id': 7, 'title': 'Express JS', 'image': 'assets/images/express.png'},
    {'id': 8, 'title': 'Laravel', 'image': 'assets/images/laravel.png'},
    {'id': 9, 'title': 'Django', 'image': 'assets/images/django.png'},
  ];

  final List app = [
    {'id': 1, 'title': 'Java', 'image': 'assets/images/java.png'},
    {'id': 2, 'title': 'React Native', 'image': 'assets/images/react.png'},
    {'id': 3, 'title': 'Flutter', 'image': 'assets/images/flutter.png'}
  ];

  final List database = [
    {'id': 1, 'title': 'Firebase', 'image': 'assets/images/firebase.png'},
    {'id': 2, 'title': 'MongoDB', 'image': 'assets/images/mongodb.png'},
    {'id': 3, 'title': 'MySQL', 'image': 'assets/images/mysql.png'}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Code Labs'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/logo_hero.png', height: 80),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  'Learning video resource for new learner. Free best video course that you start your learning journey.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 16),
                CategoryView(title: 'Development', items: devs),
                CategoryView(title: 'Language',items: language),
                CategoryView(title: 'Web Development',items: web),
                CategoryView(title: 'Apps Development',items: app),
                CategoryView(title: 'Database',items: database)
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            CourseApi.divisions();
          },
          child: const Icon(Icons.add)
      ),
    );
  }
}
