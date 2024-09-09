import 'package:cached_network_image/cached_network_image.dart';
import 'package:code_labs/screen/courses_screen.dart';
import 'package:flutter/material.dart';

class GridItem extends StatelessWidget {
  final String id;
  final String name;
  final String image;
  const GridItem({super.key, required this.name, required this.image, required this.id});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CoursesScreen(title: name, id: id)));
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 1)
              )
            ]
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: CachedNetworkImage(
                imageUrl: 'https://flutter-codelabs-api.onrender.com$image',
                placeholder: (context, url) => Image.asset('assets/images/empty_image.png'),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            const SizedBox(height: 8),
            Text(name),
          ],
        ),
      ),
    );
  }
}
