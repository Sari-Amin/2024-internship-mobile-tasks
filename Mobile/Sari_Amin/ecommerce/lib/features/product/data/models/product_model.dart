import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

import '../../domian/entities/product_entity.dart';

class ProductModel {
  const ProductModel({
    required String name,
    required int price,
    required int id,
    required String imageUrl,
    required String description,
  }) : super(
          id: id,
          name: name,
          price: price,
          imageUrl: imageUrl,
          description: description,
        );

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
      name: name,
      price: price,
      id: id,
      imageUrl: imageUrl,
      description: description);
  ProductEntity toEntity() => ProductEntity(
      id: id,
      description: description,
      imageUrl: imageUrl,
      name: name,
      price: price);

  static Future<ProductModel?> forLocalJson(decode) {}
}
