enum ProductTag {
  STRONG_ALCO,
  LIGHT_ALCO,
  NON_ALCO,
  SYRUP,
  FOOD,
  EQUIPMENT
}

String productTagToJson(ProductTag tag) {
  return tag.toString().split('.').last;
}
