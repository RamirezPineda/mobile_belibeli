import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  static List categoriesList = [
    ['Category', true],
    ['T-Shirts', false],
    ['Jackets', false],
    ['Shirts', false],
    ['Jeans', false],
    ['Bags', false],
    ['Caps', false],
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoriesList.length,
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
                        'https://res.cloudinary.com/dwn7fonh6/image/upload/v1715909768/portfolio/ecommerce/categories/tshirt_hhtlsj.png',
                        fit: BoxFit.cover,
                        height: 45,
                        width: 45,
                        errorBuilder: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  ),
                  Text(
                    categoriesList[index][0],
                    style: TextStyle(
                      fontSize: 12.5,
                      fontWeight: FontWeight.w600,
                      color: categoriesList[index][1]
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
