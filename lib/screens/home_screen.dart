import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/book.dart';
import '../widgets/book_widget.dart';
import 'cart_screen.dart';
import '../models/cart.dart';


class HomeScreen extends StatelessWidget {
  final List<Book> books = [
    Book(
      id: '1',
      title: 'Catcher in the Rye',
      author: 'J.D.Saliger',
      price: 29.99,
      imageUrl: 'assets/images/The Catcher.jpg',
      category: 'Fiction',
      starRating: 4.5,
    ),
    Book(
      id: '2',
      title: 'To Kill A mocking bird',
      author: 'Haper Lee',
      price: 24.99,
      imageUrl: 'assets/images/MockingBird.jpg',
      category: 'Classic Literature',
      starRating: 4.7,
    ),
    Book(
      id: '3',
      title: 'The Greate Gatsby',
      author: 'F.Scott-Fitzgerald',
      price: 34.99,
      imageUrl: 'assets/images/GreateGatsby.jpg',
      category: 'Fiction',
      starRating: 4.3,
    ),
    Book(
      id: '4',
      title: 'Things Fall Apart',
      author: 'Chinua Achebe',
      price: 34.99,
      imageUrl: 'assets/images/FallApart.jpg',
      category: 'Historical Fiction',
      starRating: 4.6,
    ),
     Book(
      id: '5',
      title: 'Think like a Monk',
      author: 'Jay Shetty',
      price: 44.99,
      imageUrl: 'assets/images/Monk.jpg',
      category: 'Positive Thinking',
      starRating: 3.5,
    ),
     Book(
      id: '6',
      title: 'Pollyanna',
      author: 'Eleanor H. Porter',
      price: 34.99,
      imageUrl: 'assets/images/Pollyana.jpg',
      category: "childern's literature",
      starRating: 4.7,
    ),
  ];

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Store'),
        actions: [
          Consumer<CartProvider>(
            builder: (context, cart, child) {
              return Padding(
                padding: const EdgeInsets.only(right: 10.0), // Add padding to move left
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.shopping_cart),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CartScreen(),
                  ),
                );
              },
                ),
                if (cart.itemCount > 0)
                  Positioned(
                    right: 7,
                    top: 3,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '${cart.itemCount}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                    ),
                  ),
                ),
              ),
          ],
        ),
      );
    },
  ),
],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 0.6,
        children: books.map((book) => BookWidget(book: book)).toList(),
      ),
    );
  }
}