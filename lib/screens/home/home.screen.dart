import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

import 'package:app_belibeli/routes/app_router.dart';
import 'package:app_belibeli/providers/providers.dart';
import 'package:app_belibeli/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final categoryProvider = context.watch<CategoryProvider>();
    final categories = categoryProvider.categories;

    return Scaffold(
      // extendBodyBehindAppBar: true,
      body: Column(
        children: [
          // search
          Padding(
            padding: const EdgeInsets.only(top: 50.0, left: 15, right: 15),
            child: Row(
              children: [
                SizedBox(
                  height: 60,
                  width: 320,
                  child: TextField(
                    style: const TextStyle(fontSize: 14),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      prefixIcon: Icon(
                        Icons.search,
                        size: 30,
                        color: Colors.grey.shade600,
                      ),
                      hintText: 'Search your style',
                      hintStyle: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade400,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade600),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                const Badge(
                  label: Text('3'),
                  child: Icon(
                    CupertinoIcons.bell_fill,
                    size: 30,
                    color: Color(0xff1d242d),
                  ),
                ),
              ],
            ),
          ),
          // end search
          const SizedBox(height: 20),

          Categories(
            categories: categories,
            onSelectedCategory: (int value) =>
                setState(() => categoryProvider.categorySelected = value),
            categorySelected: categoryProvider.categorySelected,
          ),
          // const SizedBox(height: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                padding: const EdgeInsets.only(top: 12, bottom: 10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 10 / 16,
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemCount: categories.isNotEmpty
                    ? categories[categoryProvider.categorySelected]
                        .product!
                        .length
                    : 0,
                itemBuilder: (_, index) => ProductCard(
                  product: categories[categoryProvider.categorySelected]
                      .product![index],
                  isFavorite: true,
                  onTap: () => context.push(
                      '${Routes.product}/${categories[categoryProvider.categorySelected].product![index].id}'),
                ),
              ),
            ),
          ),
          //
        ],
      ),
    );
  }
}
