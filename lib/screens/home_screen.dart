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
      title: 'The Catcher in the Rye',
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
      id: '3',
      title: 'Things Fall Apart',
      author: 'Chinua Achebe',
      price: 34.99,
      imageUrl: 'assets/images/FallApart.jpg',
      category: 'Historical Fiction',
      starRating: 4.6,
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
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: books.length,
        itemBuilder: (context, index) {
          return BookWidget(book: books[index]);
        },
      ),
    );
  }
}