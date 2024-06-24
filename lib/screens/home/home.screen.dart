import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:app_belibeli/routes/app_router.dart';
import 'package:app_belibeli/providers/providers.dart';
import 'package:app_belibeli/widgets/widgets.dart';

enum AppbarActionType { leading, trailing }

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Widget _topCategoriesHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Top categories",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              "See All",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget appBarActionButton(AppbarActionType type) {
    IconData icon = Icons.ac_unit_outlined;

    if (type == AppbarActionType.trailing) {
      icon = Icons.search;
    }

    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFFE5E6E8),
      ),
      child: IconButton(
        padding: const EdgeInsets.all(8),
        constraints: const BoxConstraints(),
        onPressed: () {},
        icon: Icon(icon, color: Colors.black),
      ),
    );
  }

  PreferredSize get _appBar {
    return PreferredSize(
      preferredSize: const Size.fromHeight(100),
      child: Container(
        color: Colors.red,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                appBarActionButton(AppbarActionType.leading),
                appBarActionButton(AppbarActionType.trailing),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final categoryProvider = context.watch<CategoryProvider>();

    return Scaffold(
      // extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
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
                          borderSide:
                              const BorderSide(color: Colors.transparent),
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

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/images/offer.png',
                  fit: BoxFit.cover,
                  height: 150,
                  width: double.infinity,
                  errorBuilder: (context, url, error) =>
                      const Icon(Icons.error),
                ),
              ),
            ),

            // categories
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 15),
            //   child: _topCategoriesHeader(context),
            // ),
            Categories(
              categories: categoryProvider.categories,
            ),
            const SizedBox(height: 10),

            // best sellers
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Best seller",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "See all",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 300,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ProductCard('1', 'Tshirt-gray nike', context),
                  ProductCard('2', 'Tshirt-gray nike', context),
                  ProductCard('3', 'Tshirt-gray nike', context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget ProductCard(String id, String name, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
      child: Container(
        width: 190,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          // color: const Color(0xff1f232a),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0.5,
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // product image
            InkWell(
              onTap: () => context.push(Routes.product),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  // color: const Color(0xff1f232a),
                  color: Colors.grey.shade200,
                ),
                child: Hero(
                  tag: id,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: CachedNetworkImage(
                            imageUrl:
                                'https://res.cloudinary.com/dwn7fonh6/image/upload/v1715909768/portfolio/ecommerce/categories/tshirt_hhtlsj.png',
                            placeholder: (context, url) => const Loading(),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                            fit: BoxFit.cover,
                            height: 140,
                            width: 190,
                          ),
                        ),
                        Positioned(
                          top: 5.0,
                          right: 5.0,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            height: 35,
                            width: 35,
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                CupertinoIcons.heart_fill,
                                color: Colors.grey.shade300,
                                size: 22,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            //product name
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Shirt',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade400,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    name + name,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.yellow.shade600),
                          const SizedBox(width: 2),
                          const Text(
                            '4.9',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        "\$${150.00}",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
