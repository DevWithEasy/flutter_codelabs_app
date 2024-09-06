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
    final List<Category> categories = Category.fromMap(d['categories']) as dynamic;
    return Division(
        id: d['_id'],
        name: d['name'],
        categories: categories
    );
  }
}