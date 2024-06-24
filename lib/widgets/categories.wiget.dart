import 'package:flutter/material.dart';
import 'package:app_belibeli/models/models.dart';

class Categories extends StatelessWidget {
  final List<Category> categories;
  const Categories({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
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
                      child: Image.network(
                        categories[index].imageUrl,
                        fit: BoxFit.cover,
                        height: 45,
                        width: 45,
                        errorBuilder: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  ),
                  Text(
                    categories[index].name,
                    style: TextStyle(
                      fontSize: 12.5,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade500,
                      //  color: categories[index].id
                      //     ? Colors.grey.shade900
                      //     : Colors.grey.shade600,
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
