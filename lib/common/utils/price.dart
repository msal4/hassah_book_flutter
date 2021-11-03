final priceRegexp = RegExp(r"(\d)(?=(\d{3})+$)");

String formatPrice(num price) {
  return price
      .round()
      .toString()
      .replaceAllMapped(priceRegexp, (m) => m.group(1) + ",");
}
