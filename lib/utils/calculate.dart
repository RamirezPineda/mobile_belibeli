class TCalculate {
  static double calculatePrice(
      {required double price, required double tax, double? discount}) {
    final discountAmount = discount ?? 0;
    final taxValue = double.parse((tax * 0.01).toStringAsFixed(3));
    final priceWithDiscount = price - (price * discountAmount);
    return double.parse((priceWithDiscount + (priceWithDiscount * taxValue))
        .toStringAsFixed(2));
  }
}
