class Category{
  final String id;
  final String name;
  final String image;
  final String division;
  final int courses;

  Category({
    required this.id,
    required this.name,
    required this.image,
    required this.division,
    required this.courses
  });

  factory Category.fromMap(Map<String,dynamic> cat){
    return Category(
        id: cat['_id'],
        name: cat['name'],
        image: cat['image'],
        division: cat['division'],
        courses: cat['courses']
    );
  }
}