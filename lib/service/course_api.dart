import 'dart:convert';

import 'package:code_labs/model/division.dart';
import 'package:http/http.dart' as http;

class CourseApi{
  static Future<List<Division>> divisions() async {
    try{
      final uri = Uri.parse('https://flutter-codelabs-api.onrender.com/api/division');
      final response = await http.get(uri);
      final bodyData = response.body;
      final jsonData = jsonDecode(bodyData) as List<dynamic>;
      final data = jsonData.map((d){
        return Division.fromMap(d);
      }).toList();
      return data;
    }catch (e){
      print('Division fetch failed: $e');
      // Return an empty list on error
      return [];
    }
  }
}