import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Detail',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductDetailPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProductDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300.0,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                'https://imgs.search.brave.com/p1kg1MCYQnZP04CkD8ieS0Fpz7ngXRDzHvYwe4-8gCc/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tLm1l/ZGlhLWFtYXpvbi5j/b20vaW1hZ2VzL0kv/NTFpZE1jZnFhZUwu/anBn',
                fit: BoxFit.cover,
              ),
            ),
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.blue),
              onPressed: () {},
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Men's Sneaker",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Jordan',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '\$220',
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.star,
                                  color: Colors.yellow, size: 20.0),
                              Text('4.0'),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Size:',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    children: List.generate(6, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: ChoiceChip(
                          label: Text((39 + index).toString()),
                          selected: index == 2,
                          onSelected: (selected) {},
                          selectedColor: Colors.blue,
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'About this item\n100% Authentic \n Occasion type : All Occasion\nClosure.type : Lace-Up\nPattern type : Solid\nHeel.type : Flat\nSpecial feature : Lightweight',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey[700],
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OutlinedButton(
                        onPressed: () {},
                        child:
                            Text('DELETE', style: TextStyle(color: Colors.red)),
                        style: OutlinedButton.styleFrom(
                          primary: Colors.white,
                          padding: EdgeInsets.symmetric(
                            horizontal: 32.0,
                            vertical: 12.0,
                          ),
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        child:
                            Text('UPDATE', style: TextStyle(color: Colors.red)),
                        style: OutlinedButton.styleFrom(
                          primary: Color.fromARGB(255, 246, 248, 249),
                          padding: EdgeInsets.symmetric(
                            horizontal: 32.0,
                            vertical: 12.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
