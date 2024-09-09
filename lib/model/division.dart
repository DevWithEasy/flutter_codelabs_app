import 'package:code_labs/model/category.dart';

class Division{
  final String id;
  final String name;
  final List<Category> categories;
  Division({
    required this.id,
    required this.name,
    required this.categories
  });


  factory Division.fromMap(Map<String,dynamic> d){
    final categories = (d['categories'] as List<dynamic>).map((cat) {
      return Category.fromMap(cat as Map<String, dynamic>);
    }).toList();

    return Division(
        id: d['_id'],
        name: d['name'],
        categories: categories
    );
  }
}