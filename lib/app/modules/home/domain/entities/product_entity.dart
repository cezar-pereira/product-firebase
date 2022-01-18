class ProductEntity {
  final String id;
  final String title;
  final String type;
  final double price;
  final String description;
  final String fileName;
  final int height;
  final int width;
  final int rating;
  final DateTime createdAt;

  ProductEntity({
    this.id = '',
    required this.title,
    required this.type,
    required this.price,
    this.description = '',
    this.fileName = '',
    this.height = 0,
    this.width = 0,
    this.rating = 0,
  }) : createdAt = DateTime.now();
}
