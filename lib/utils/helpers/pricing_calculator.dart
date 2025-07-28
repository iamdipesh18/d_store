class TPricingCalculator {
  /// -- Calculate Price based on TAX and Shipping
  static double calculateTotalPrice(double prodictPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = prodictPrice * taxRate;

    double shippingCost = getShippingCost(location);
    double totalPrice = prodictPrice + taxAmount + shippingCost;
    return totalPrice;
  }

  /// --- Calculate Shipping Cost
  static String calculateShippingCost(double productPrice, String location) {
    double shippingCost = getShippingCost(location);
      return shippingCost.toStringAsFixed(2);
    }
  

  /// --- Calculate Tax Cost
  static String calculateTax(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;
    return taxAmount.toStringAsFixed(2);
  }

  static double getTaxRateForLocation(String location) {
    // Lookup the shipping cost for the given location using a shipping rate api 
    //calculate the shipping cost based on various factors like distance weight etc
    return 0.1; // Example: 10% tax rate
  }

  static double getShippingCost(String location) {
    // Lookup the shipping cost for the given location using a shipping rate api 
    //calculate the shipping cost based on various factors like distance weight etc
    return 5.0; // Example: $5 shipping cost
  }


  //Sum all Cart value and return total amount
  // static double calculateCartTotal(CartModel cart) {
  //   return cart.items.map((e) => e.price ).fold(0.0, (previousPrice, currentPrice) => previousPrice + (currentPrice ?? 0));
  // }

}
