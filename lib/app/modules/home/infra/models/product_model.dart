import 'package:products_firebase/app/modules/home/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    String id = '',
    required String title,
    required String type,
    required double price,
    required DateTime createdAt,
    String description = '',
    String fileName = '',
    int height = 0,
    int width = 0,
    int rating = 0,
  }) : super(
          id: id,
          title: title,
          type: type,
          price: price,
          description: description,
          fileName: fileName,
          height: height,
          width: width,
          rating: rating,
        );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'type': type,
      'price': price,
      'description': description,
      'fileName': fileName,
      'height': height,
      'width': width,
      'rating': rating,
      'createdAt': createdAt
    };
  }

  factory ProductModel.fromMap({required Map<String, dynamic> map}) {
    return ProductModel(
        id: map['id'],
        title: map['title'],
        type: map['type'],
        price: map['price'],
        description: map['description'],
        fileName: map['filename'],
        height: map['height'],
        width: map['width'],
        rating: map['rating'],
        createdAt: map['createdAt']);
  }
}
