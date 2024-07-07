import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:app_belibeli/models/models.dart';

class Categories extends StatelessWidget {
  final List<Category> categories;
  final int categorySelected;
  final void Function(int value) onSelectedCategory;
  const Categories({
    super.key,
    required this.categories,
    required this.onSelectedCategory,
    required this.categorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => onSelectedCategory(index),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      color: Colors.grey.shade300,
                      padding: const EdgeInsets.all(2),
                      child: CachedNetworkImage(
                        imageUrl: categories[index].imageUrl,
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                        fit: BoxFit.cover,
                        height: 45,
                        width: 45,
                      ),
                    ),
                  ),
                  Text(
                    categories[index].name,
                    style: TextStyle(
                      fontSize: 12.5,
                      fontWeight: FontWeight.w600,
                      color: categorySelected == index
                          ? Colors.grey.shade900
                          : Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
