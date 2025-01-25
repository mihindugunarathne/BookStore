class Book {
  final String id;
  final String title;
  final String author;
  final double price;
  final String imageUrl;
  final bool isAsset;
  final String category;
  final double starRating;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.price,
    required this.imageUrl,
    required this.category,
    this.starRating = 4.0,
    this.isAsset = true,
  });
}