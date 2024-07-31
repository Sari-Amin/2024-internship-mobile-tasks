import 'dart:io';

void main() {
  ProdcutManager pm = ProdcutManager();

  print(
      "Options:\n 1. Add Product \n 2. View All Products \n 3. View Single Product \n 4. Edit Specific Product \n 5. Delete Specific Product \n 6. Exit");

  String? command = stdin.readLineSync();

  while (command != "6" && command != null) {
    switch (command) {
      case "1":
        {
          String? name = stdin.readLineSync();
          String? price = stdin.readLineSync();
          String? description = stdin.readLineSync();
          if (name != null && price != null) {
            pm.addProduct(name, int.parse(price), description: description);
          } else {
            print("invalid value");
          }
        }
        break;
      case "2":
        {
          pm.viewAllProducts();
        }
        break;
      case "3":
        {
          String? name = stdin.readLineSync();
          if (name != null) {
            pm.viewSingleProduct(name);
          } else {
            print("Invalid value");
          }
        }
        break;
      case "4":
        {
          String? name = stdin.readLineSync();
          String? price = stdin.readLineSync();
          String? description = stdin.readLineSync();
          if (name != null && price != null) {
            pm.editProduct(name, int.parse(price), description);
          } else {
            print("Invalid value");
          }
        }
        break;
      case "5":
        {
          String? name = stdin.readLineSync();
          if (name != null) {
            pm.deleteProduct(name);
          } else {
            print("Invalid value");
          }
        }
    }
    print(
        "\nOptions:\n 1. Add Product \n 2. View All Products \n 3. View Single Product \n 4. Edit Specific Product \n 5. Delete Specific Product \n 6. Exit\n");
    command = stdin.readLineSync();
  }
}

class Product {
  String name = "";
  String description = "";
  int price = 0;

  Product(String name, int price, {description = ""}) {
    this.name = name;
    this.price = price;
    this.description = description;
  }
  String descGetter() {
    return this.description;
  }

  int priceGetter() {
    return this.price;
  }

  String nameGetter() {
    return this.name;
  }
}

class ProdcutManager {
  Map<String, Product> products = {};
  ProdcutManager() {}

  void addProduct(String name, int price, {description = ""}) {
    Product p = Product(name, price, description: description);
    this.products[name] = p;
    print("$name product is successfully Added");
  }

  void viewAllProducts() {
    int lenght = 0;
    for (Product p in products.values) {
      String name = p.nameGetter();
      int price = p.priceGetter();
      String desc = p.descGetter();
      print("name : $name" + " Price : $price" + " Description : $desc");
      lenght += 1;
    }
    if (lenght == 0) {
      print("No Product is found!");
    }
  }

  void viewSingleProduct(String name) {
    if (products.containsKey(name)) {
      int price = products[name]!.priceGetter();
      String desc = products[name]!.descGetter();
      print("name : $name");
      print("Price : $price");
      print("Description : $desc");
    } else {
      print("Product not found!");
    }
  }

  void editProduct(String name, int price, [description]) {
    if (products.containsKey(name)) {
      Product p = Product(name, price, description: description);
      products[name] = p;
      print("$name Edited");
    } else {
      print("Product not found!");
    }
  }

  void deleteProduct(String name) {
    if (products.containsKey(name)) {
      products.remove(name);
      print("$name successfully removed");
    } else {
      print("Product not found!");
    }
  }
}
