import 'package:code_labs/screen/videos_screen.dart';
import 'package:flutter/material.dart';

class CoursesScreen extends StatefulWidget {
  final String id;
  final String title;
  const CoursesScreen({super.key, required this.title, required this.id});

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  final List courses = [
    {
      "id": 1,
      "cat_id": 1,
      "cat_image": "assets/images/js.png",
      "title": "Javascript for beginners to advance",
      "instructor": "Anisul Islam",
      "language": "Bangla",
      "duration": "5 hours",
      "lesson": "25"
    },
    {
      "id": 2,
      "cat_id": 1,
      "cat_image": "assets/images/js.png",
      "title": "Complete beginners Course deep dive learning",
      "instructor": "Sumit Saha",
      "language": "English",
      "duration": "6 hours",
      "lesson": "45"
    },
    {
      "id": 3,
      "cat_id": 1,
      "cat_image": "assets/images/js.png",
      "title": "Complete basic to advance javascript",
      "instructor": "Hasan",
      "language": "Hindi",
      "duration": "10 hours",
      "lesson": "200"
    }
  ];

  @override
  Widget build(BuildContext context) {
    print(widget.id);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView.separated(
          itemCount: courses.length,
          itemBuilder: (BuildContext context, index) {
            return InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => VideosScreen(
                      title: courses[index]['title'],
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
                        Image.asset(
                          courses[index]['cat_image'],
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
                            courses[index]['language'],
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
                            courses[index]['title'],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            'Instructor: ${courses[index]['instructor']}',
                            style: TextStyle(color: Colors.grey.shade600),
                          ),
                          Text(
                            'Duration: ${courses[index]['duration']}',
                            style: TextStyle(color: Colors.grey.shade600),
                          ),
                          Text(
                            'Lesson: ${courses[index]['lesson']}',
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
