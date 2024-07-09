import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:app_belibeli/models/models.dart';
import 'package:app_belibeli/utils/utils.dart';

class ItemCard extends StatelessWidget {
  final ShoppingCart shoppingCart;
  final void Function()? onTapImage;
  final void Function()? addToCart;
  final void Function()? reduceCartQuantity;

  const ItemCard({
    super.key,
    required this.shoppingCart,
    this.onTapImage,
    this.addToCart,
    this.reduceCartQuantity,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      child: Row(
        children: [
          // image
          InkWell(
            onTap: onTapImage,
            child: Hero(
              tag: shoppingCart.product.id,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: shoppingCart.product.productImage[0].url,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    height: 60,
                    width: 60,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),

          // name
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 190,
                child: Text(
                  shoppingCart.product.name,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "\$${(TCalculate.calculatePrice(
                      price: shoppingCart.product.price,
                      tax: shoppingCart.product.tax,
                      discount: shoppingCart.product.discount?.amount,
                    ) * shoppingCart.quantity).toStringAsFixed(2)}",
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(width: 5),
          Row(
            children: [
              InkWell(
                onTap: reduceCartQuantity,
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 4.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.grey.shade100,
                  ),
                  child: Text(
                    '-',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.grey.shade800,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                shoppingCart.quantity.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              const SizedBox(width: 10),
              InkWell(
                onTap: addToCart,
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 4.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.grey.shade800,
                  ),
                  child: const Text(
                    '+',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
