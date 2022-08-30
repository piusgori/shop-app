import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/dummy_data.dart';
import 'package:flutter_complete_guide/widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(25),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200, childAspectRatio: 1.5, crossAxisSpacing: 20, mainAxisSpacing: 20),
        children: DUMMY_CATEGORIES.map((catData) => CategoryItem(catData.title, catData.color, catData.id)).toList(),
    );
  }
}
