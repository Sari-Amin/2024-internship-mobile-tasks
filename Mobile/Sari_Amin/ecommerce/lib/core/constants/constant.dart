class Urls {
  static const String baseUrl = 'https://fakestoreapi.com/products';
  static String getProduct(String id) => '$baseUrl/$id';
}
