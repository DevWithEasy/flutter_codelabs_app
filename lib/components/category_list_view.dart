import 'package:flutter/material.dart';

class CategoryListView extends StatelessWidget {
  final String title;
  final List items;
  const CategoryListView({super.key, required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      primary: false,
      itemCount: items.length,
      itemBuilder: (BuildContext context, index){
        return Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8)
          ),
          child: Row(
            children: [
              Image.asset(
                items[index]['image'],
                height: 50,
                width: 50,
              ),
              const SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(items[index]['title']),
                  const Text('5 course available'),
                ],
              )
            ],
          ),
        );
      },
      separatorBuilder: (BuildContext context, index){
        return const SizedBox(height: 10,);
      },
    );
  }
}
