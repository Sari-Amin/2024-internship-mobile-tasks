import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Derby Leather Shoes',
      home: ProductPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back, color: Colors.blue),
        title: Text('Search Product', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Leather',
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ProductCard(
                  imageUrl:
                      'https://imgs.search.brave.com/p1kg1MCYQnZP04CkD8ieS0Fpz7ngXRDzHvYwe4-8gCc/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tLm1l/ZGlhLWFtYXpvbi5j/b20vaW1hZ2VzL0kv/NTFpZE1jZnFhZUwu/anBn',
                  title: 'Derby Leather Shoes',
                  price: 120.0,
                  rating: 4.0,
                ),
                ProductCard(
                  imageUrl:
                      'https://imgs.search.brave.com/p1kg1MCYQnZP04CkD8ieS0Fpz7ngXRDzHvYwe4-8gCc/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tLm1l/ZGlhLWFtYXpvbi5j/b20vaW1hZ2VzL0kv/NTFpZE1jZnFhZUwu/anBn',
                  title: 'Derby Leather Shoes',
                  price: 120.0,
                  rating: 4.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final double price;
  final double rating;

  ProductCard({
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            imageUrl,
            width: 100,
            height: 100,
          ),
          SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  '\$${price.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 16.0,
                    ),
                    SizedBox(width: 4.0),
                    Text(
                      rating.toStringAsFixed(1),
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Handle 'APPLY' button press
            },
            child: Text('APPLY'),
          ),
        ],
      ),
    );
  }
}
