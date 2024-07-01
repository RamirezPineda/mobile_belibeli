class TConverter {
  static double jsonToDouble(dynamic jsonValue) {
    if (jsonValue is int) {
      return jsonValue.toDouble();
    } else if (jsonValue is double) {
      return jsonValue;
    } else {
      return 0.0;
    }
  }
}
