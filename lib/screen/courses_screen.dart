import 'package:code_labs/model/course.dart';
import 'package:code_labs/screen/videos_screen.dart';
import 'package:code_labs/service/course_api.dart';
import 'package:flutter/material.dart';

class CoursesScreen extends StatefulWidget {
  final String id;
  final String title;
  const CoursesScreen({super.key, required this.title, required this.id});

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  late List<Course> courses = [];
  bool loading = false;

  @override
  void initState() {
    fetchCourses();
    super.initState();
  }

  void fetchCourses()async{
    loading = true;
    final data = await CourseApi.courses(widget.id);
    setState(() {
      courses = data;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: loading ?
      const CircularProgressIndicator() : Padding(
        padding: const EdgeInsets.all(12),
        child: ListView.separated(
          itemCount: courses.length,
          itemBuilder: (BuildContext context, index) {
            return InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => VideosScreen(
                      title: courses[index].name,
                      id : courses[index].id
                    ),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 5,
                      spreadRadius: 2,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Image.network(
                          'https://flutter-codelabs-api.onrender.com${courses[index].image}',
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.only(left: 4, right: 4),
                          decoration: BoxDecoration(
                            color: Colors.green.shade50,
                          ),
                          child: Text(
                            courses[index].language,
                            style: const TextStyle(
                                color: Colors.green, fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            courses[index].name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            'Instructor: ${courses[index].instructor}',
                            style: TextStyle(color: Colors.grey.shade600),
                          ),
                          Text(
                            'Lesson: ${courses[index].lesson}',
                            style: TextStyle(color: Colors.grey.shade600),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, index) {
            return const SizedBox(height: 10);
          },
        ),
      ),
    );
  }
}
