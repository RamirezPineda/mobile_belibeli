import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:app_belibeli/models/models.dart';
import 'package:app_belibeli/widgets/widgets.dart';
import 'package:app_belibeli/utils/utils.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final bool isFavorite;
  final void Function()? onTap;

  const ProductCard(
      {super.key, required this.product, required this.isFavorite, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
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
            onTap: onTap,
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
                tag: product.id,
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
                          imageUrl: product.productImage[0].url,
                          placeholder: (context, url) => const Loading(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                          fit: BoxFit.contain,
                          height: 135,
                          width: 170,
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
                              color: isFavorite
                                  ? Colors.red.shade400
                                  : Colors.grey.shade300,
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
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.category?.name ?? 'Shirt',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade400,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  product.name,
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
                    Text(
                      "\$${TCalculate.calculatePrice(
                        price: product.price,
                        tax: product.tax,
                        discount: product.discount?.amount,
                      ).toStringAsFixed(2)}",
                      style: const TextStyle(
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
    );
  }
}
