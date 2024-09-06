import 'package:code_labs/model/category.dart';
import 'package:flutter/material.dart';

import 'grid_item.dart';

class CategoryView extends StatelessWidget {
  final String name;
  final List<Category> items;
  const CategoryView({super.key, required this.items, required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600
            ),
          ),
          const SizedBox(height: 5,),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.0,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10
            ),
            itemBuilder: (BuildContext context, index) {
              return GridItem(
                  id :  items[index].id,
                  name: items[index].name,
                  image: items[index].image
              );
            },
          )
        ],
      ),
    );
  }
}
