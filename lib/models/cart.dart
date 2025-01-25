import 'package:flutter/foundation.dart';
import 'book.dart';

class CartProvider extends ChangeNotifier {
  final List<Book> _items = [];

  List<Book> get items => _items;

  int get itemCount => _items.length;

  double get totalAmount {
    return _items.fold(0, (sum, item) => sum + item.price);
  }

  void addItem(Book book) {
    _items.add(book);
    notifyListeners();
  }

  void removeItem(Book book) {
    _items.remove(book);
    notifyListeners();
  }
}