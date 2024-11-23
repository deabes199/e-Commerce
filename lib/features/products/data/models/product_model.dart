import 'package:json_annotation/json_annotation.dart';
part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  final List<Product> products;

  ProductModel({required this.products});
  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}

@JsonSerializable()
class Product {
  final int? id;
  final String? title;
  final String? description;
  final String? category;
  final double? price;
  final double? rating;
  final List<String>? images;
  final int? stock;
  final String? brand;
  @JsonKey(name: 'thumbnail')
  final String? mainImage;
  final List<Review> reviews;

  Product(this.reviews,
      {required this.id,
      required this.title,
      required this.description,
      required this.category,
      required this.price,
      required this.rating,
      required this.images,
      required this.stock,
      required this.brand,
      required this.mainImage});
  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}

@JsonSerializable()
class Review {
  final String comment;
  final String reviewerName;
  final double rating;
  final String reviewerEmail;
  final String date;

  Review(
      {required this.comment,
      required this.reviewerName,
      required this.rating,
      required this.reviewerEmail,
      required this.date});

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewToJson(this);
}
