class Course{
  final String id;
  final String name;
  final String instructor;
  final String language;
  final String lesson;
  final String category;
  Course({
    required this.id,
    required this.name,
    required this.instructor,
    required this.language,
    required this.lesson,
    required this.category,
});
  factory Course.fromMap(Map<String,dynamic> course){
    return Course(
        id: course['_id'],
        name: course['name'],
        instructor: course['instructor'],
        language: course['language'],
        lesson: course['lesson'].toString(),
        category: course['category']
    );
  }
}