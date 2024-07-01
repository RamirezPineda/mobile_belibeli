import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:app_belibeli/models/models.dart';
import 'package:app_belibeli/providers/providers.dart';

class ProductScreen extends StatelessWidget {
  final String? id;
  const ProductScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final productFavoriteProvider = context.watch<ProductFavoriteProvider>();
    final product = productFavoriteProvider.getProductById(id ?? '');

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          top: false,
          child: Column(
            children: [
              // product image
              Hero(
                tag: product.id,
                child: Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                          top: 50.0, left: 15.0, right: 15.0),
                      // color: Colors.grey.shade200,
                      child: CachedNetworkImage(
                        imageUrl: product.productImage[0].url,
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                        fit: BoxFit.contain,
                        height: 320,
                        width: double.infinity,
                      ),
                    ),
                    Positioned(
                      top: 50,
                      left: 20,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 0.5,
                              blurRadius: 5,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        height: 35,
                        width: 35,
                        child: IconButton(
                          onPressed: () => context.pop(),
                          icon: const Icon(
                            CupertinoIcons.arrow_left,
                            size: 22,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 50,
                      right: 20,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 0.5,
                              blurRadius: 5,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        height: 35,
                        width: 35,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            CupertinoIcons.heart_fill,
                            color: Colors.red.shade400,
                            size: 22,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 10),

                    // product name
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.yellow.shade600),
                        const SizedBox(width: 5),
                        const Text(
                          '4.9',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(width: 5),
                        const Text(
                          ' 188 Reviews',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(width: 5),
                        const Text(
                          ' +10K Sold',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    // product price
                    Row(
                      children: [
                        Text(
                          '\$${product.price}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          '\$${product.price}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.red.shade400,
                            decoration: TextDecoration.lineThrough,
                            decorationColor: Colors.red.shade400,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '25% off',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.green.shade400,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // product details
                    const Text(
                      'Details',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                    Text(product.description),

                    const SizedBox(height: 10),

                    const Text('Package Dimensions  : ' +
                        '27.3 x 24.8 x 4.9 cm; 180 gr'),
                    const Text(
                        'Date First Available     : ' + 'August 08, 2024'),
                    Text(
                        'Department                  : ${product.department == Department.MEN ? 'Men' : 'Woman'}'),
                    // Text('Specification                : ' +
                    //     'Moisture Wicking, Stretchy, SPF/UV Protection, Easy Cate'),
                    const SizedBox(height: 30),

                    // add to cart button
                    MaterialButton(
                      onPressed: () {},
                      elevation: 0,
                      minWidth: double.infinity,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      color: const Color(0xff1d242d),
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          'Add to Bag',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
