import 'package:flutter/material.dart';
import 'add_update_page.dart';
import 'search_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductListScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProductListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Available Products'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Handle search action
              Navigator.of(context).pushNamed('/search_page.dart');
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 3, // Number of products
        itemBuilder: (context, index) {
          return ProductCard();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle add new product action
          Navigator.of(context).pushNamed('/add_upate_page.dart');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
                'https://imgs.search.brave.com/p1kg1MCYQnZP04CkD8ieS0Fpz7ngXRDzHvYwe4-8gCc/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tLm1l/ZGlhLWFtYXpvbi5j/b20vaW1hZ2VzL0kv/NTFpZE1jZnFhZUwu/anBn'), // Your product image
            SizedBox(height: 10),
            Text(
              'Jordan',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              'Men\'s shoe',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$220',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 16),
                    Text('4.0'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
