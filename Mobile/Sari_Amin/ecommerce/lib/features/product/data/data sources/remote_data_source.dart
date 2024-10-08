import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../../core/constants/constant.dart';
import '../../../../core/error/exceptions.dart';
import '../../domain/entities/product_entity.dart';
import '../models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<ProductModel> getProductById(String id);
  Future<List<ProductModel>> getAllProduct();
  Future<bool> deleteProduct(String id);
  Future<bool> insertProduct(ProductEntity product);
  Future<bool> updateProduct(String id, ProductEntity productEntity);
}

class ProductRemoteDataSourceImpl extends ProductRemoteDataSource {
  final http.Client client;
  ProductRemoteDataSourceImpl({required this.client});

  @override
  Future<ProductModel> getProductById(String id) async {
    final response = await client.get(Uri.parse(Urls.getProduct(id)));

    if (response.statusCode == 200) {
      return ProductModel.fromJsonData(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<ProductModel>> getAllProduct() async {
    List<ProductModel> allProducts = [];
    final response = await client.get(Uri.parse(Urls.baseUrl));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      data['data']
          .forEach((el) async => {allProducts.add(ProductModel.fromJson(el))});
      return allProducts;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<bool> deleteProduct(String id) async {
    final response = await client.delete(Uri.parse(Urls.getProduct(id)));

    if (response.statusCode == 200) {
      return true;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<bool> insertProduct(ProductEntity product) async {
    final Map<String, String> mapper = {
      'image': product.imageUrl,
      'name': product.name,
      'description': product.description,
      'price': '${product.price}'
    };
    final response =
        await client.post(Uri.parse(Urls.baseUrl), headers: mapper);

    if (response.statusCode == 201) {
      return true;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<bool> updateProduct(String id, ProductEntity productEntity) async {
    final Map<String, String> mapper = {
      'name': productEntity.name,
      'description': productEntity.description,
      'price': productEntity.price,
    };
    final response =
        await client.put(Uri.parse(Urls.getProduct(id)), headers: mapper);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw ServerException();
    }
  }
}
