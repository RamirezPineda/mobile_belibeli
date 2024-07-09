import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import 'package:app_belibeli/routes/app_router.dart';
import 'package:app_belibeli/providers/providers.dart';

import 'package:app_belibeli/screens/shopping-cart/widgets/item_card.dart';
import 'package:app_belibeli/screens/shopping-cart/widgets/text_card.dart';

class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({super.key});

  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  @override
  Widget build(BuildContext context) {
    final shoppingCartProvider = context.watch<ShoppingCartProvider>();
    final orderProvider = context.watch<OrderProvider>();

    final shoppingCartList = shoppingCartProvider.shoppingCart;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping cart'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: shoppingCartList.length,
              itemBuilder: (context, index) {
                final shoppingCart = shoppingCartList[index];
                return ItemCard(
                  shoppingCart: shoppingCart,
                  onTapImage: () {
                    context
                        .push('${Routes.product}/${shoppingCart.product.id}');
                  },
                  addToCart: () {
                    shoppingCartProvider.addToCart(shoppingCart.product);
                  },
                  reduceCartQuantity: () {
                    shoppingCartProvider
                        .reduceCartQuantity(shoppingCart.product.id);
                  },
                );
              },
            ),
          ),

          // total section
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            color: Colors.white,
            child: Column(
              children: [
                TextCard(
                  title: "Subtotal",
                  subTitle:
                      '\$${shoppingCartProvider.total().toStringAsFixed(2)}',
                  color: Colors.grey,
                ),
                const TextCard(
                  title: "Delivery:",
                  subTitle: 'Free',
                  color: Colors.grey,
                ),
                const SizedBox(height: 5),
                TextCard(
                  title: "Total:",
                  subTitle:
                      '\$${shoppingCartProvider.total().toStringAsFixed(2)}',
                  fontSize: 18,
                ),
                const SizedBox(height: 20),

                // checkout button
                MaterialButton(
                  onPressed: orderProvider.isLoading || shoppingCartList.isEmpty
                      ? null
                      : () async {
                          try {
                            await orderProvider.makePayment(shoppingCartList);
                            displayPaymentSheet(
                                orderProvider, shoppingCartProvider);
                          } catch (e) {
                            if (e is StripeConfigException) {
                              snackBar(context, "Payment Error");
                            } else {
                              snackBar(context,
                                  "An error occurred, try again later.");
                            }
                          }
                        },
                  elevation: 0,
                  minWidth: double.infinity,
                  disabledColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  color: const Color(0xff1d242d),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      orderProvider.isLoading ? 'Loading...' : 'Checkout',
                      style: const TextStyle(
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
    );
  }

  Future<void> displayPaymentSheet(
      OrderProvider orderProvider, ShoppingCartProvider cartProvider) async {
    try {
      // "Display payment sheet";
      await Stripe.instance.presentPaymentSheet();
      await orderProvider.createOrderPayment(cartProvider.shoppingCart);
      cartProvider.clearCart();
      // Show when payment is done, Displaying snackbar for it
      snackBar(context, "Paid successfully");
    } on StripeException catch (_) {
      // If any error comes during payment, so payment will be cancelled
      snackBar(context, " Payment Cancelled");
    } catch (e) {
      snackBar(context, "An error occurred, try again later.");
    }
  }

  snackBar(BuildContext context, String message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
